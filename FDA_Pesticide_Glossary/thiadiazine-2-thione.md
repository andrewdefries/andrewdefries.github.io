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
-3.075152, -0.9417061, -2.524561, 1, 0, 0, 1,
-2.940392, -0.8781184, -0.5489582, 1, 0.007843138, 0, 1,
-2.8538, -0.1264684, -1.384493, 1, 0.01176471, 0, 1,
-2.842358, 0.2520649, -0.7641318, 1, 0.01960784, 0, 1,
-2.699827, 0.1818993, -3.587257, 1, 0.02352941, 0, 1,
-2.614306, 1.289519, -0.6205006, 1, 0.03137255, 0, 1,
-2.587001, 0.757408, -1.214337, 1, 0.03529412, 0, 1,
-2.562333, 0.683477, -1.34877, 1, 0.04313726, 0, 1,
-2.55251, 0.4067188, -1.741684, 1, 0.04705882, 0, 1,
-2.515084, 0.7195127, -3.585537, 1, 0.05490196, 0, 1,
-2.470502, -0.4922702, -0.441048, 1, 0.05882353, 0, 1,
-2.461981, -2.543996, -1.875363, 1, 0.06666667, 0, 1,
-2.430506, 0.7470579, 0.9029001, 1, 0.07058824, 0, 1,
-2.419703, 1.399526, -0.9271004, 1, 0.07843138, 0, 1,
-2.283944, -0.09516884, -2.43266, 1, 0.08235294, 0, 1,
-2.271298, -0.122388, -1.783218, 1, 0.09019608, 0, 1,
-2.245502, 1.212324, -1.178118, 1, 0.09411765, 0, 1,
-2.237085, -0.4943571, -1.553504, 1, 0.1019608, 0, 1,
-2.174405, -0.01944459, 0.3991806, 1, 0.1098039, 0, 1,
-2.168419, -2.058905, -4.584105, 1, 0.1137255, 0, 1,
-2.150164, 0.8773279, -1.979662, 1, 0.1215686, 0, 1,
-2.106741, 0.01832603, -2.566772, 1, 0.1254902, 0, 1,
-2.105464, 0.07074195, -1.051489, 1, 0.1333333, 0, 1,
-2.075295, -0.630492, -4.014259, 1, 0.1372549, 0, 1,
-2.061867, -0.6525254, -1.499496, 1, 0.145098, 0, 1,
-2.056789, 0.2431992, -0.1732869, 1, 0.1490196, 0, 1,
-2.046585, -1.032736, 0.2008723, 1, 0.1568628, 0, 1,
-2.04111, -0.64074, -0.857024, 1, 0.1607843, 0, 1,
-2.024776, -0.4489758, -1.048057, 1, 0.1686275, 0, 1,
-2.023134, 0.0481176, -3.670521, 1, 0.172549, 0, 1,
-2.02084, -0.2050072, -2.738675, 1, 0.1803922, 0, 1,
-1.998452, 0.8821147, -0.4191948, 1, 0.1843137, 0, 1,
-1.986926, 0.4209476, -1.417084, 1, 0.1921569, 0, 1,
-1.968146, -0.1662462, -1.597861, 1, 0.1960784, 0, 1,
-1.910342, -0.1804182, -1.595114, 1, 0.2039216, 0, 1,
-1.905212, -0.6934932, -1.865263, 1, 0.2117647, 0, 1,
-1.894451, -0.3084842, -0.1811547, 1, 0.2156863, 0, 1,
-1.849551, -0.2786384, -1.793615, 1, 0.2235294, 0, 1,
-1.832438, -0.2423151, -0.8553697, 1, 0.227451, 0, 1,
-1.827145, 0.2198715, -1.516572, 1, 0.2352941, 0, 1,
-1.808671, 0.3766266, -1.572161, 1, 0.2392157, 0, 1,
-1.797853, 0.5686904, -1.821141, 1, 0.2470588, 0, 1,
-1.796845, 0.5107235, -2.409935, 1, 0.2509804, 0, 1,
-1.794098, 1.588501, -0.9252617, 1, 0.2588235, 0, 1,
-1.787282, 1.348933, -1.593945, 1, 0.2627451, 0, 1,
-1.785661, 0.1274996, -0.5350818, 1, 0.2705882, 0, 1,
-1.782681, 1.169921, -1.000659, 1, 0.2745098, 0, 1,
-1.771212, 1.843256, -1.679335, 1, 0.282353, 0, 1,
-1.765368, 0.1271582, -4.31902, 1, 0.2862745, 0, 1,
-1.764986, 0.6483492, -0.4425452, 1, 0.2941177, 0, 1,
-1.758195, 0.2371065, -0.9498548, 1, 0.3019608, 0, 1,
-1.755152, 0.8495345, -1.196424, 1, 0.3058824, 0, 1,
-1.72701, -0.6649664, -3.938822, 1, 0.3137255, 0, 1,
-1.725054, -1.081286, -0.1882768, 1, 0.3176471, 0, 1,
-1.706766, 1.407178, -2.735089, 1, 0.3254902, 0, 1,
-1.666296, 1.811743, 0.6103249, 1, 0.3294118, 0, 1,
-1.661018, -0.4743376, -1.530118, 1, 0.3372549, 0, 1,
-1.651692, -0.8013688, -1.467277, 1, 0.3411765, 0, 1,
-1.650816, 0.1401273, -1.304354, 1, 0.3490196, 0, 1,
-1.648196, -0.4127187, -3.00854, 1, 0.3529412, 0, 1,
-1.643905, 1.23753, -0.466543, 1, 0.3607843, 0, 1,
-1.599245, -0.527859, -1.139938, 1, 0.3647059, 0, 1,
-1.575374, 0.2832187, -2.144151, 1, 0.372549, 0, 1,
-1.561475, -0.8745912, -3.485105, 1, 0.3764706, 0, 1,
-1.561315, -1.39734, -1.312041, 1, 0.3843137, 0, 1,
-1.560442, 0.8549294, -1.635804, 1, 0.3882353, 0, 1,
-1.558169, -1.363775, -2.564439, 1, 0.3960784, 0, 1,
-1.539585, -3.259305, -2.848333, 1, 0.4039216, 0, 1,
-1.53877, -0.3730755, -0.04278708, 1, 0.4078431, 0, 1,
-1.531646, -0.8246118, -1.133968, 1, 0.4156863, 0, 1,
-1.530019, -2.119709, -0.9937385, 1, 0.4196078, 0, 1,
-1.522156, -2.826745, -4.32957, 1, 0.427451, 0, 1,
-1.519283, -0.9756013, -1.165247, 1, 0.4313726, 0, 1,
-1.518146, 0.07470841, -2.798043, 1, 0.4392157, 0, 1,
-1.510939, 0.6644003, -1.074291, 1, 0.4431373, 0, 1,
-1.499746, 0.2211149, -1.70274, 1, 0.4509804, 0, 1,
-1.49966, 0.104709, -0.887552, 1, 0.454902, 0, 1,
-1.497392, -0.2645912, -2.922024, 1, 0.4627451, 0, 1,
-1.467959, -1.262833, -3.042762, 1, 0.4666667, 0, 1,
-1.467364, -1.133124, -3.483743, 1, 0.4745098, 0, 1,
-1.465969, -0.5362018, -3.143273, 1, 0.4784314, 0, 1,
-1.460132, -0.6943492, -3.396755, 1, 0.4862745, 0, 1,
-1.459025, -0.2087225, -2.807573, 1, 0.4901961, 0, 1,
-1.442566, -1.872633, -3.679158, 1, 0.4980392, 0, 1,
-1.421413, -0.6332804, -0.6940755, 1, 0.5058824, 0, 1,
-1.374711, 1.991831, -1.16634, 1, 0.509804, 0, 1,
-1.369372, 0.8583178, 0.6425992, 1, 0.5176471, 0, 1,
-1.358404, 1.358646, -0.5340687, 1, 0.5215687, 0, 1,
-1.353632, 0.04367831, -2.463358, 1, 0.5294118, 0, 1,
-1.353166, -0.301379, -1.11309, 1, 0.5333334, 0, 1,
-1.346049, 0.8348409, 0.9816141, 1, 0.5411765, 0, 1,
-1.334717, 0.637279, -1.764671, 1, 0.5450981, 0, 1,
-1.315551, 2.063288, -1.052687, 1, 0.5529412, 0, 1,
-1.299824, -0.6894591, -3.771981, 1, 0.5568628, 0, 1,
-1.291895, -1.134509, -2.711676, 1, 0.5647059, 0, 1,
-1.286204, 0.9542907, -0.4615105, 1, 0.5686275, 0, 1,
-1.281871, 0.289205, -2.053765, 1, 0.5764706, 0, 1,
-1.28142, -0.7831565, -3.226339, 1, 0.5803922, 0, 1,
-1.281135, 0.1626846, -1.418119, 1, 0.5882353, 0, 1,
-1.270786, 0.3547429, -0.882699, 1, 0.5921569, 0, 1,
-1.260085, 0.5487481, -1.244866, 1, 0.6, 0, 1,
-1.250413, 0.258278, -2.070368, 1, 0.6078432, 0, 1,
-1.247267, -0.9583518, -2.410546, 1, 0.6117647, 0, 1,
-1.238782, 0.3343719, -2.363749, 1, 0.6196079, 0, 1,
-1.22756, 0.3449427, -1.5772, 1, 0.6235294, 0, 1,
-1.227232, -0.4722151, -1.262364, 1, 0.6313726, 0, 1,
-1.224878, -1.37373, -3.193895, 1, 0.6352941, 0, 1,
-1.218392, -0.4400877, -1.091091, 1, 0.6431373, 0, 1,
-1.20847, 1.189887, -2.415602, 1, 0.6470588, 0, 1,
-1.205855, 1.176499, -1.380068, 1, 0.654902, 0, 1,
-1.203125, 1.463609, -0.7800345, 1, 0.6588235, 0, 1,
-1.196247, -1.050582, -1.346971, 1, 0.6666667, 0, 1,
-1.182267, 0.353481, -2.426361, 1, 0.6705883, 0, 1,
-1.17849, -0.1689456, -2.212596, 1, 0.6784314, 0, 1,
-1.172708, -2.273118, -2.766331, 1, 0.682353, 0, 1,
-1.168902, -0.246012, -1.706677, 1, 0.6901961, 0, 1,
-1.163177, -0.7194048, -1.984278, 1, 0.6941177, 0, 1,
-1.160863, -0.7969492, -2.596014, 1, 0.7019608, 0, 1,
-1.160199, 1.635007, 0.334785, 1, 0.7098039, 0, 1,
-1.157084, -0.6400172, -2.602414, 1, 0.7137255, 0, 1,
-1.156816, -0.5181612, -0.9879796, 1, 0.7215686, 0, 1,
-1.151426, -0.1000832, -0.01644703, 1, 0.7254902, 0, 1,
-1.149919, -1.416365, -0.946573, 1, 0.7333333, 0, 1,
-1.147632, -0.8105077, -1.292162, 1, 0.7372549, 0, 1,
-1.14731, -1.492766, -3.804795, 1, 0.7450981, 0, 1,
-1.136828, 0.4836732, 0.5666195, 1, 0.7490196, 0, 1,
-1.134226, -0.0359273, -1.076822, 1, 0.7568628, 0, 1,
-1.105675, 0.6607456, -0.6506833, 1, 0.7607843, 0, 1,
-1.105658, 1.556372, 0.09404317, 1, 0.7686275, 0, 1,
-1.105137, 1.498084, -1.412092, 1, 0.772549, 0, 1,
-1.10203, 0.01720717, -1.155416, 1, 0.7803922, 0, 1,
-1.101814, 0.5863031, -1.814521, 1, 0.7843137, 0, 1,
-1.093268, 0.01635262, -0.8688436, 1, 0.7921569, 0, 1,
-1.087089, -1.679348, -2.335623, 1, 0.7960784, 0, 1,
-1.083705, -1.311798, -3.468086, 1, 0.8039216, 0, 1,
-1.07951, 0.05395411, -1.525783, 1, 0.8117647, 0, 1,
-1.058594, -0.6874464, -2.301485, 1, 0.8156863, 0, 1,
-1.052714, -2.193384, -3.660222, 1, 0.8235294, 0, 1,
-1.048064, 0.4296165, -1.649268, 1, 0.827451, 0, 1,
-1.046369, 0.5961853, -0.8125798, 1, 0.8352941, 0, 1,
-1.04583, -0.05861011, -2.732054, 1, 0.8392157, 0, 1,
-1.035063, -1.192109, 0.9152454, 1, 0.8470588, 0, 1,
-1.031081, 0.3551031, -1.711238, 1, 0.8509804, 0, 1,
-1.028726, 0.3257804, -2.980884, 1, 0.8588235, 0, 1,
-1.025497, 1.637412, 0.8409633, 1, 0.8627451, 0, 1,
-1.022232, 0.6813433, -2.216958, 1, 0.8705882, 0, 1,
-1.011799, 2.115511, -0.264394, 1, 0.8745098, 0, 1,
-1.004276, -0.3715369, -1.762491, 1, 0.8823529, 0, 1,
-1.002818, -0.4480979, -3.38516, 1, 0.8862745, 0, 1,
-0.9921692, -1.533643, -2.603815, 1, 0.8941177, 0, 1,
-0.9914523, -0.4849318, -3.843871, 1, 0.8980392, 0, 1,
-0.9889802, -1.114949, -3.235426, 1, 0.9058824, 0, 1,
-0.9868464, -0.2741983, -0.3853349, 1, 0.9137255, 0, 1,
-0.9837192, 1.582486, 1.149619, 1, 0.9176471, 0, 1,
-0.9798025, -1.379666, -2.395875, 1, 0.9254902, 0, 1,
-0.975654, 0.101881, 0.5806313, 1, 0.9294118, 0, 1,
-0.9752226, 2.482763, -1.602553, 1, 0.9372549, 0, 1,
-0.9731121, -0.6619404, -1.641234, 1, 0.9411765, 0, 1,
-0.9647963, 0.7327511, 0.410019, 1, 0.9490196, 0, 1,
-0.9518855, 0.3704334, -0.1362454, 1, 0.9529412, 0, 1,
-0.9514872, 1.924026, -0.7534552, 1, 0.9607843, 0, 1,
-0.9422569, 1.045001, 0.3677797, 1, 0.9647059, 0, 1,
-0.9376735, 1.025569, 0.3448575, 1, 0.972549, 0, 1,
-0.9364183, -3.040366, -2.552744, 1, 0.9764706, 0, 1,
-0.9340431, -0.2556824, -2.153384, 1, 0.9843137, 0, 1,
-0.9329423, -1.853866, -2.781839, 1, 0.9882353, 0, 1,
-0.9300882, 0.1162537, -2.681929, 1, 0.9960784, 0, 1,
-0.927896, -0.358386, -3.538707, 0.9960784, 1, 0, 1,
-0.9275861, 0.7925375, 0.6481183, 0.9921569, 1, 0, 1,
-0.9254243, -0.5445485, -0.6554565, 0.9843137, 1, 0, 1,
-0.9253209, -0.2432417, -0.475883, 0.9803922, 1, 0, 1,
-0.9220075, -1.183902, -2.111966, 0.972549, 1, 0, 1,
-0.9210111, 1.6089, 0.288213, 0.9686275, 1, 0, 1,
-0.9200662, -1.698155, -4.404842, 0.9607843, 1, 0, 1,
-0.9184638, 0.01842535, -3.362503, 0.9568627, 1, 0, 1,
-0.9143995, -0.4303667, -1.72085, 0.9490196, 1, 0, 1,
-0.9140123, 0.2825042, -0.8015626, 0.945098, 1, 0, 1,
-0.9121499, 0.1843778, -1.090506, 0.9372549, 1, 0, 1,
-0.9064419, -0.8779423, -1.053299, 0.9333333, 1, 0, 1,
-0.8965576, 1.613555, 1.739849, 0.9254902, 1, 0, 1,
-0.8951215, 0.7144936, -0.8090647, 0.9215686, 1, 0, 1,
-0.8816394, 2.272026, -0.6268812, 0.9137255, 1, 0, 1,
-0.879567, -0.04819252, -2.12459, 0.9098039, 1, 0, 1,
-0.8758392, 0.6332957, -0.3404978, 0.9019608, 1, 0, 1,
-0.8750257, 0.5347006, -1.718363, 0.8941177, 1, 0, 1,
-0.8749369, 0.09150287, -2.404994, 0.8901961, 1, 0, 1,
-0.8701487, 1.163043, -0.8622084, 0.8823529, 1, 0, 1,
-0.8605433, -0.2879113, -1.466555, 0.8784314, 1, 0, 1,
-0.8583314, 1.354428, -0.832929, 0.8705882, 1, 0, 1,
-0.8505243, 0.3685744, -1.228372, 0.8666667, 1, 0, 1,
-0.8390604, 0.1860102, -1.266507, 0.8588235, 1, 0, 1,
-0.8324059, -0.3548644, -1.296714, 0.854902, 1, 0, 1,
-0.8292205, 0.5823992, 0.7048625, 0.8470588, 1, 0, 1,
-0.828594, 0.8255002, -0.3197082, 0.8431373, 1, 0, 1,
-0.821781, 0.705723, -0.629236, 0.8352941, 1, 0, 1,
-0.8199919, 0.5596344, -2.859051, 0.8313726, 1, 0, 1,
-0.8192762, 0.9444928, -0.02646784, 0.8235294, 1, 0, 1,
-0.8175336, -1.39777, -1.780895, 0.8196079, 1, 0, 1,
-0.8074414, -1.848229, -3.237029, 0.8117647, 1, 0, 1,
-0.8055285, 0.3740889, -1.985166, 0.8078431, 1, 0, 1,
-0.7948422, 0.5760774, 0.4336318, 0.8, 1, 0, 1,
-0.7907031, 1.712693, -0.4226728, 0.7921569, 1, 0, 1,
-0.786808, 0.06904274, -0.9257723, 0.7882353, 1, 0, 1,
-0.7858336, -0.7163365, -1.998883, 0.7803922, 1, 0, 1,
-0.7838101, 1.055514, -0.3180403, 0.7764706, 1, 0, 1,
-0.7821668, 1.14122, 0.2986532, 0.7686275, 1, 0, 1,
-0.7715036, 0.5321712, -1.491371, 0.7647059, 1, 0, 1,
-0.7612828, 1.183925, 0.3345267, 0.7568628, 1, 0, 1,
-0.7602328, -0.54798, -3.700817, 0.7529412, 1, 0, 1,
-0.7528002, 1.041624, -0.9115518, 0.7450981, 1, 0, 1,
-0.7515048, -0.4892076, -1.808079, 0.7411765, 1, 0, 1,
-0.7491802, 1.448479, 0.2296383, 0.7333333, 1, 0, 1,
-0.7470283, 0.3299737, -0.3332219, 0.7294118, 1, 0, 1,
-0.7451417, 2.603534, -0.2086858, 0.7215686, 1, 0, 1,
-0.7420954, 0.9121215, -1.748968, 0.7176471, 1, 0, 1,
-0.7420481, -0.2193287, -2.086771, 0.7098039, 1, 0, 1,
-0.7387633, -1.605608, -1.764958, 0.7058824, 1, 0, 1,
-0.737259, 1.143101, -1.783625, 0.6980392, 1, 0, 1,
-0.7320305, -0.7791268, -1.723267, 0.6901961, 1, 0, 1,
-0.7283273, 0.7197178, 2.238832, 0.6862745, 1, 0, 1,
-0.7240638, -0.7891886, -1.32749, 0.6784314, 1, 0, 1,
-0.7226228, 0.628598, 0.5428966, 0.6745098, 1, 0, 1,
-0.7203186, -0.1311894, -0.6055363, 0.6666667, 1, 0, 1,
-0.7118976, 0.6026836, -1.877525, 0.6627451, 1, 0, 1,
-0.709027, -0.3352404, -0.3215753, 0.654902, 1, 0, 1,
-0.7078833, -1.048987, -3.111331, 0.6509804, 1, 0, 1,
-0.7011492, -1.435255, -2.19264, 0.6431373, 1, 0, 1,
-0.6953157, -0.319867, -2.262564, 0.6392157, 1, 0, 1,
-0.6902239, -0.4020992, -2.295897, 0.6313726, 1, 0, 1,
-0.687705, 0.05454047, -2.607371, 0.627451, 1, 0, 1,
-0.685259, 0.8572811, 1.086223, 0.6196079, 1, 0, 1,
-0.6801295, -2.397126, -2.80055, 0.6156863, 1, 0, 1,
-0.6747043, 1.229858, 0.1919557, 0.6078432, 1, 0, 1,
-0.6745965, 1.339174, -0.9565636, 0.6039216, 1, 0, 1,
-0.6697946, 0.941509, -0.211776, 0.5960785, 1, 0, 1,
-0.6649126, -0.5742755, -0.5890587, 0.5882353, 1, 0, 1,
-0.6625246, -1.464828, -1.441425, 0.5843138, 1, 0, 1,
-0.6623565, 0.4434561, 0.7528719, 0.5764706, 1, 0, 1,
-0.6616234, -0.2020585, -1.977581, 0.572549, 1, 0, 1,
-0.6606234, -0.3660163, -3.514912, 0.5647059, 1, 0, 1,
-0.6535016, 1.013434, -0.5504839, 0.5607843, 1, 0, 1,
-0.6533318, 0.3534984, -1.934002, 0.5529412, 1, 0, 1,
-0.6522318, 1.704371, -0.6487173, 0.5490196, 1, 0, 1,
-0.6522262, 0.864118, -0.6798738, 0.5411765, 1, 0, 1,
-0.6501009, -0.5773923, -0.7767949, 0.5372549, 1, 0, 1,
-0.6492375, 1.28623, -0.3144679, 0.5294118, 1, 0, 1,
-0.6487424, -1.476162, -1.888982, 0.5254902, 1, 0, 1,
-0.6474717, -0.2290011, -1.568088, 0.5176471, 1, 0, 1,
-0.6354419, 1.447505, 0.940712, 0.5137255, 1, 0, 1,
-0.6335263, -1.080852, -1.996166, 0.5058824, 1, 0, 1,
-0.6257592, -0.8276204, -2.48871, 0.5019608, 1, 0, 1,
-0.6254507, -0.9140169, -2.338827, 0.4941176, 1, 0, 1,
-0.6249812, -0.02032418, -3.04718, 0.4862745, 1, 0, 1,
-0.6218978, -0.8309429, -4.627135, 0.4823529, 1, 0, 1,
-0.6182799, -0.804933, -1.858394, 0.4745098, 1, 0, 1,
-0.6176174, 1.626299, -1.121037, 0.4705882, 1, 0, 1,
-0.6151205, -0.2746928, -2.641075, 0.4627451, 1, 0, 1,
-0.6113268, 1.106695, -0.5257123, 0.4588235, 1, 0, 1,
-0.6094149, -1.795917, -4.223386, 0.4509804, 1, 0, 1,
-0.6090353, 2.057852, 1.235563, 0.4470588, 1, 0, 1,
-0.6067603, 1.468956, 0.2990201, 0.4392157, 1, 0, 1,
-0.6010948, 0.4308276, -0.3758259, 0.4352941, 1, 0, 1,
-0.5939302, -0.7892944, -2.880802, 0.427451, 1, 0, 1,
-0.5892341, -0.08125924, 0.5411189, 0.4235294, 1, 0, 1,
-0.5887437, 0.5460244, -1.190873, 0.4156863, 1, 0, 1,
-0.5885537, 1.497154, -1.222924, 0.4117647, 1, 0, 1,
-0.5867276, 0.02352985, -2.68758, 0.4039216, 1, 0, 1,
-0.5844489, 0.4140109, -1.11788, 0.3960784, 1, 0, 1,
-0.5746629, 0.5832843, -1.674145, 0.3921569, 1, 0, 1,
-0.5721524, -0.03813987, -2.227763, 0.3843137, 1, 0, 1,
-0.5666798, -0.8133146, -3.029686, 0.3803922, 1, 0, 1,
-0.5653825, -0.6683489, -2.801655, 0.372549, 1, 0, 1,
-0.5637895, 0.5115092, -2.026166, 0.3686275, 1, 0, 1,
-0.5619923, 0.354861, -0.5438001, 0.3607843, 1, 0, 1,
-0.5612542, -0.2836347, -1.884517, 0.3568628, 1, 0, 1,
-0.5589361, 1.014828, -2.094033, 0.3490196, 1, 0, 1,
-0.5519288, 1.89038, -0.7882987, 0.345098, 1, 0, 1,
-0.5500368, -0.07254697, -1.652062, 0.3372549, 1, 0, 1,
-0.5484965, -0.9444924, -3.196248, 0.3333333, 1, 0, 1,
-0.5420781, 1.009322, -0.887753, 0.3254902, 1, 0, 1,
-0.5414324, 0.05518097, -2.354818, 0.3215686, 1, 0, 1,
-0.5400084, -0.3154067, -3.133422, 0.3137255, 1, 0, 1,
-0.5344425, -0.9678949, -1.551271, 0.3098039, 1, 0, 1,
-0.5334265, 1.15967, -1.274342, 0.3019608, 1, 0, 1,
-0.5312344, -0.6806839, -2.644094, 0.2941177, 1, 0, 1,
-0.5299202, -1.522483, -1.845137, 0.2901961, 1, 0, 1,
-0.5287875, -0.06369599, -1.466787, 0.282353, 1, 0, 1,
-0.5283153, 0.9231498, 0.3330657, 0.2784314, 1, 0, 1,
-0.5251633, -0.3038757, -1.294208, 0.2705882, 1, 0, 1,
-0.5239325, -0.611793, -1.969616, 0.2666667, 1, 0, 1,
-0.5180677, 1.443841, 0.1655753, 0.2588235, 1, 0, 1,
-0.5145007, -1.085169, -2.416492, 0.254902, 1, 0, 1,
-0.5137983, 1.808104, -1.298719, 0.2470588, 1, 0, 1,
-0.5074292, -0.2845432, -5.344861, 0.2431373, 1, 0, 1,
-0.50459, -0.1633964, -1.649195, 0.2352941, 1, 0, 1,
-0.5045053, -0.4708607, -2.23981, 0.2313726, 1, 0, 1,
-0.5015091, 1.65275, 1.322217, 0.2235294, 1, 0, 1,
-0.5009398, -0.4565666, -2.107145, 0.2196078, 1, 0, 1,
-0.5008069, -1.925924, -3.056457, 0.2117647, 1, 0, 1,
-0.4963656, -0.7159619, -1.994714, 0.2078431, 1, 0, 1,
-0.4908601, 0.2705762, -0.07581007, 0.2, 1, 0, 1,
-0.4891831, 0.1808772, -1.682922, 0.1921569, 1, 0, 1,
-0.4864683, -0.02461228, -1.778117, 0.1882353, 1, 0, 1,
-0.4784881, -2.302258, -2.453696, 0.1803922, 1, 0, 1,
-0.4782663, -0.4822463, -2.828569, 0.1764706, 1, 0, 1,
-0.477158, -0.291068, -1.160723, 0.1686275, 1, 0, 1,
-0.4709322, -0.9334047, -2.453321, 0.1647059, 1, 0, 1,
-0.468303, -0.31601, -2.359156, 0.1568628, 1, 0, 1,
-0.4678598, -0.7952012, -3.15498, 0.1529412, 1, 0, 1,
-0.4677838, -0.4106516, -3.469761, 0.145098, 1, 0, 1,
-0.464466, 1.154914, -1.136097, 0.1411765, 1, 0, 1,
-0.4635584, -0.9346876, -2.978583, 0.1333333, 1, 0, 1,
-0.4628536, -0.2735593, -2.291215, 0.1294118, 1, 0, 1,
-0.4619442, 0.224653, -1.123793, 0.1215686, 1, 0, 1,
-0.4507225, -0.8932801, -0.8716211, 0.1176471, 1, 0, 1,
-0.4507175, -0.2268195, -1.784326, 0.1098039, 1, 0, 1,
-0.4471118, -0.9730201, -1.984113, 0.1058824, 1, 0, 1,
-0.4423624, -0.5080415, -3.089422, 0.09803922, 1, 0, 1,
-0.4415787, -0.4786823, -0.9843341, 0.09019608, 1, 0, 1,
-0.4375738, -1.000119, -2.137625, 0.08627451, 1, 0, 1,
-0.4375131, 1.454618, -0.8129318, 0.07843138, 1, 0, 1,
-0.4318028, 1.094079, -1.136072, 0.07450981, 1, 0, 1,
-0.4302564, -0.1251107, -1.008684, 0.06666667, 1, 0, 1,
-0.425509, 0.9533377, 0.2474444, 0.0627451, 1, 0, 1,
-0.4216653, -1.237062, -1.304285, 0.05490196, 1, 0, 1,
-0.4197094, 1.617661, 0.5060038, 0.05098039, 1, 0, 1,
-0.4183401, -0.4980351, -3.592974, 0.04313726, 1, 0, 1,
-0.4180664, -0.8391539, -4.025467, 0.03921569, 1, 0, 1,
-0.4076119, 1.353431, 0.951238, 0.03137255, 1, 0, 1,
-0.4074276, 0.978692, 0.0688156, 0.02745098, 1, 0, 1,
-0.4063254, -0.06036938, -3.128946, 0.01960784, 1, 0, 1,
-0.4046949, 0.005491003, -2.785392, 0.01568628, 1, 0, 1,
-0.4042033, 0.617834, -0.8740051, 0.007843138, 1, 0, 1,
-0.4037284, -0.8023161, -3.072173, 0.003921569, 1, 0, 1,
-0.3989752, -0.679451, -4.114427, 0, 1, 0.003921569, 1,
-0.3947739, -0.4814858, -2.289043, 0, 1, 0.01176471, 1,
-0.3923685, 0.9852048, 0.8999709, 0, 1, 0.01568628, 1,
-0.3898939, 0.146367, -0.3160471, 0, 1, 0.02352941, 1,
-0.3834404, 0.576121, 0.4261544, 0, 1, 0.02745098, 1,
-0.3827805, 0.2168234, -1.248207, 0, 1, 0.03529412, 1,
-0.3826072, -0.5088543, -2.104749, 0, 1, 0.03921569, 1,
-0.3757153, -0.5929284, -2.460691, 0, 1, 0.04705882, 1,
-0.3731836, 1.091891, -0.3250986, 0, 1, 0.05098039, 1,
-0.3687015, -0.04400549, -3.054957, 0, 1, 0.05882353, 1,
-0.3669559, 0.09661325, -1.329088, 0, 1, 0.0627451, 1,
-0.3627247, -0.04127933, -0.4092412, 0, 1, 0.07058824, 1,
-0.3617333, -0.5298238, -2.106924, 0, 1, 0.07450981, 1,
-0.3608194, 1.899817, 0.1133821, 0, 1, 0.08235294, 1,
-0.3597183, 1.238218, -0.3512137, 0, 1, 0.08627451, 1,
-0.3587606, 0.0531227, -0.561008, 0, 1, 0.09411765, 1,
-0.3573546, 0.9087316, -0.4660882, 0, 1, 0.1019608, 1,
-0.3494736, -0.3732388, -1.121317, 0, 1, 0.1058824, 1,
-0.3492126, 1.151905, -0.1928351, 0, 1, 0.1137255, 1,
-0.3458729, -0.03972447, -1.651771, 0, 1, 0.1176471, 1,
-0.3389909, 1.903745, 1.387775, 0, 1, 0.1254902, 1,
-0.3383424, 0.5957386, -2.753801, 0, 1, 0.1294118, 1,
-0.3329585, -1.357027, -2.730037, 0, 1, 0.1372549, 1,
-0.3279572, 2.322831, -0.4683646, 0, 1, 0.1411765, 1,
-0.3271499, 0.8292802, -1.349777, 0, 1, 0.1490196, 1,
-0.3268842, -1.329595, -2.546439, 0, 1, 0.1529412, 1,
-0.3263275, -1.026468, -3.370715, 0, 1, 0.1607843, 1,
-0.3242975, -0.8383464, -3.715874, 0, 1, 0.1647059, 1,
-0.3237303, -0.0217249, -1.853907, 0, 1, 0.172549, 1,
-0.3236727, 0.6129954, -1.431233, 0, 1, 0.1764706, 1,
-0.3178025, 1.770846, -2.139062, 0, 1, 0.1843137, 1,
-0.3149663, -0.6434436, -3.593214, 0, 1, 0.1882353, 1,
-0.3107995, 1.454354, -1.59558, 0, 1, 0.1960784, 1,
-0.3083721, 0.3299969, -0.5720091, 0, 1, 0.2039216, 1,
-0.3072609, -0.2670201, -1.777006, 0, 1, 0.2078431, 1,
-0.3071328, 1.49229, -0.3974279, 0, 1, 0.2156863, 1,
-0.3070804, -1.351642, -2.216557, 0, 1, 0.2196078, 1,
-0.3032986, -0.2793161, 0.3170054, 0, 1, 0.227451, 1,
-0.3013334, -0.2811722, -1.650677, 0, 1, 0.2313726, 1,
-0.2857661, 0.1883943, -1.151251, 0, 1, 0.2392157, 1,
-0.2822212, -0.6699315, -0.5321953, 0, 1, 0.2431373, 1,
-0.2814738, -0.4652632, -3.044355, 0, 1, 0.2509804, 1,
-0.2813026, -0.6926153, -3.343435, 0, 1, 0.254902, 1,
-0.279351, -2.920642, -2.24081, 0, 1, 0.2627451, 1,
-0.2783978, -1.074341, -2.009576, 0, 1, 0.2666667, 1,
-0.2729992, -0.3442924, -3.220777, 0, 1, 0.2745098, 1,
-0.2709878, -1.815323, -3.729537, 0, 1, 0.2784314, 1,
-0.2701462, 1.120874, -0.3418335, 0, 1, 0.2862745, 1,
-0.2700587, -0.403688, -4.379607, 0, 1, 0.2901961, 1,
-0.2693019, 0.0001274757, -0.4257562, 0, 1, 0.2980392, 1,
-0.2605222, 2.153815, 0.5934558, 0, 1, 0.3058824, 1,
-0.2538035, -0.1407385, -2.447603, 0, 1, 0.3098039, 1,
-0.2532775, 0.7547199, -1.882482, 0, 1, 0.3176471, 1,
-0.2530613, 0.7894892, 1.011195, 0, 1, 0.3215686, 1,
-0.2419451, 0.9356294, -1.693889, 0, 1, 0.3294118, 1,
-0.2360847, -1.031855, -3.01511, 0, 1, 0.3333333, 1,
-0.2356463, -0.1349912, -2.484235, 0, 1, 0.3411765, 1,
-0.2335331, 0.4069667, -0.8017837, 0, 1, 0.345098, 1,
-0.2327363, 0.3072237, -0.9978161, 0, 1, 0.3529412, 1,
-0.2305173, 0.1925139, -0.4248442, 0, 1, 0.3568628, 1,
-0.2287124, 0.3661828, 1.585083, 0, 1, 0.3647059, 1,
-0.2280674, -0.1002392, -1.472974, 0, 1, 0.3686275, 1,
-0.2267452, 0.467475, 0.1535462, 0, 1, 0.3764706, 1,
-0.2245374, 0.2825696, -0.7433016, 0, 1, 0.3803922, 1,
-0.2229441, 1.388952, 1.260356, 0, 1, 0.3882353, 1,
-0.2224082, -0.3443024, -2.5674, 0, 1, 0.3921569, 1,
-0.2170359, -0.4117327, -0.9168224, 0, 1, 0.4, 1,
-0.2166891, -0.4716406, -3.191235, 0, 1, 0.4078431, 1,
-0.2124365, 0.5986735, -0.4682188, 0, 1, 0.4117647, 1,
-0.2112316, 0.5599695, 0.8413918, 0, 1, 0.4196078, 1,
-0.2099508, 0.7643728, -0.7744067, 0, 1, 0.4235294, 1,
-0.2064363, 0.1129028, -1.131295, 0, 1, 0.4313726, 1,
-0.2027581, -0.8361203, -2.579748, 0, 1, 0.4352941, 1,
-0.2006537, -0.3012726, -3.999654, 0, 1, 0.4431373, 1,
-0.200042, 1.18267, 0.2226679, 0, 1, 0.4470588, 1,
-0.1997686, -1.364097, -4.434381, 0, 1, 0.454902, 1,
-0.1989048, 0.1599589, 0.7398136, 0, 1, 0.4588235, 1,
-0.1979865, 0.3967737, -1.848683, 0, 1, 0.4666667, 1,
-0.1964788, 1.145926, -0.4950092, 0, 1, 0.4705882, 1,
-0.1950518, -0.1688429, -5.124945, 0, 1, 0.4784314, 1,
-0.1874365, 0.4158206, -0.03279247, 0, 1, 0.4823529, 1,
-0.1870159, -1.972305, -3.102315, 0, 1, 0.4901961, 1,
-0.1866223, 1.223604, -1.169959, 0, 1, 0.4941176, 1,
-0.1850371, -1.027774, -3.35349, 0, 1, 0.5019608, 1,
-0.181813, 0.2049304, -2.072652, 0, 1, 0.509804, 1,
-0.1776629, 0.0759963, -1.422041, 0, 1, 0.5137255, 1,
-0.1769667, 0.832171, 1.814132, 0, 1, 0.5215687, 1,
-0.1756593, 1.126169, -1.372591, 0, 1, 0.5254902, 1,
-0.1737704, 0.8059639, -1.411571, 0, 1, 0.5333334, 1,
-0.1733554, 0.6195257, -1.076903, 0, 1, 0.5372549, 1,
-0.1725423, 0.4506228, -0.1047005, 0, 1, 0.5450981, 1,
-0.1685353, -1.235234, -4.550611, 0, 1, 0.5490196, 1,
-0.1669054, 0.07120153, 1.569677, 0, 1, 0.5568628, 1,
-0.1663178, -1.696371, -2.684426, 0, 1, 0.5607843, 1,
-0.1627196, 2.215641, 0.7545312, 0, 1, 0.5686275, 1,
-0.1587124, -0.09675735, -2.716908, 0, 1, 0.572549, 1,
-0.1584118, -0.7451446, -2.687057, 0, 1, 0.5803922, 1,
-0.1561325, -0.6162295, -4.041188, 0, 1, 0.5843138, 1,
-0.1558106, -0.9090449, -3.833534, 0, 1, 0.5921569, 1,
-0.1545713, 1.217001, -1.126375, 0, 1, 0.5960785, 1,
-0.1541361, -2.193711, -2.923683, 0, 1, 0.6039216, 1,
-0.1537516, -0.2415034, -1.63064, 0, 1, 0.6117647, 1,
-0.1524155, -0.2510036, -3.086802, 0, 1, 0.6156863, 1,
-0.1516861, 2.867417, -0.8030658, 0, 1, 0.6235294, 1,
-0.150198, -0.0799709, -1.761961, 0, 1, 0.627451, 1,
-0.147468, 0.2445894, -0.7851909, 0, 1, 0.6352941, 1,
-0.1465324, -0.1023179, -1.96185, 0, 1, 0.6392157, 1,
-0.1461307, -0.409067, -4.378784, 0, 1, 0.6470588, 1,
-0.1447468, 2.108299, -0.4165218, 0, 1, 0.6509804, 1,
-0.1443014, 0.1540891, -2.313449, 0, 1, 0.6588235, 1,
-0.1438091, 0.8195276, 0.8302165, 0, 1, 0.6627451, 1,
-0.1400171, -0.1347569, -1.816435, 0, 1, 0.6705883, 1,
-0.1383092, 0.2299775, -2.6746, 0, 1, 0.6745098, 1,
-0.1369099, -0.4206095, -2.77887, 0, 1, 0.682353, 1,
-0.1352563, 0.6428529, 1.52826, 0, 1, 0.6862745, 1,
-0.133862, -1.618834, -2.811088, 0, 1, 0.6941177, 1,
-0.1337873, -1.567081, -2.165174, 0, 1, 0.7019608, 1,
-0.1330124, 1.790045, 1.204405, 0, 1, 0.7058824, 1,
-0.130887, -1.536089, -3.538287, 0, 1, 0.7137255, 1,
-0.130374, 1.018583, -2.15341, 0, 1, 0.7176471, 1,
-0.1301508, 0.6409885, -0.3342281, 0, 1, 0.7254902, 1,
-0.1244373, -0.5135086, -4.087082, 0, 1, 0.7294118, 1,
-0.1244308, 0.5994835, -0.6966029, 0, 1, 0.7372549, 1,
-0.1243299, -1.248989, -4.279397, 0, 1, 0.7411765, 1,
-0.1205133, 0.9640898, -0.01865208, 0, 1, 0.7490196, 1,
-0.1204616, -1.974177, -3.153986, 0, 1, 0.7529412, 1,
-0.1179763, -0.1107038, -2.118007, 0, 1, 0.7607843, 1,
-0.1179565, 0.3369396, -1.868829, 0, 1, 0.7647059, 1,
-0.1155788, -1.586055, -1.626986, 0, 1, 0.772549, 1,
-0.1145633, -0.9295056, -2.743533, 0, 1, 0.7764706, 1,
-0.1086703, -0.9422764, -2.342981, 0, 1, 0.7843137, 1,
-0.1051313, -1.283756, -3.015307, 0, 1, 0.7882353, 1,
-0.1044756, -0.8012723, -3.234098, 0, 1, 0.7960784, 1,
-0.1028094, 1.429192, 0.2642078, 0, 1, 0.8039216, 1,
-0.09882471, 0.9898915, -1.35512, 0, 1, 0.8078431, 1,
-0.09762126, 0.07497369, -0.5435277, 0, 1, 0.8156863, 1,
-0.09759523, 1.10763, 0.08718198, 0, 1, 0.8196079, 1,
-0.09375043, -1.252117, -2.228777, 0, 1, 0.827451, 1,
-0.08763118, 1.009668, -1.559688, 0, 1, 0.8313726, 1,
-0.08635873, -1.92129, -3.866694, 0, 1, 0.8392157, 1,
-0.08512899, 0.3359904, 1.163333, 0, 1, 0.8431373, 1,
-0.08153056, 0.1516927, -0.3610244, 0, 1, 0.8509804, 1,
-0.08124639, 0.1135485, -1.758064, 0, 1, 0.854902, 1,
-0.07739589, 0.9453601, 1.022727, 0, 1, 0.8627451, 1,
-0.07398806, -2.105894, -2.878289, 0, 1, 0.8666667, 1,
-0.07344421, -2.042935, -2.755469, 0, 1, 0.8745098, 1,
-0.07062756, -0.2215849, -3.25789, 0, 1, 0.8784314, 1,
-0.0696717, 0.8699067, 2.136763, 0, 1, 0.8862745, 1,
-0.06260505, -0.8706199, -3.330332, 0, 1, 0.8901961, 1,
-0.05739075, -0.3505232, -3.021985, 0, 1, 0.8980392, 1,
-0.04999968, -1.116788, -1.894271, 0, 1, 0.9058824, 1,
-0.0496377, 1.385301, -0.01832178, 0, 1, 0.9098039, 1,
-0.04136879, -0.1098692, -2.732342, 0, 1, 0.9176471, 1,
-0.04121744, -1.037387, 0.2314437, 0, 1, 0.9215686, 1,
-0.03966056, 1.062557, -0.3601213, 0, 1, 0.9294118, 1,
-0.03928313, 0.7329893, -0.1958353, 0, 1, 0.9333333, 1,
-0.03744591, -2.592327, -1.602754, 0, 1, 0.9411765, 1,
-0.0364935, 1.235591, -1.18033, 0, 1, 0.945098, 1,
-0.03434192, -0.1473549, -3.021369, 0, 1, 0.9529412, 1,
-0.03406613, -0.3444578, -1.234347, 0, 1, 0.9568627, 1,
-0.03336857, -1.058689, -4.744028, 0, 1, 0.9647059, 1,
-0.03097307, -0.01630353, -1.691138, 0, 1, 0.9686275, 1,
-0.0268211, -0.1602679, -2.699317, 0, 1, 0.9764706, 1,
-0.02588165, 0.8974161, -0.3114119, 0, 1, 0.9803922, 1,
-0.02400088, -0.8645257, -1.560013, 0, 1, 0.9882353, 1,
-0.0219118, -1.381993, -2.488313, 0, 1, 0.9921569, 1,
-0.02051995, -1.829726, -3.31254, 0, 1, 1, 1,
-0.01752984, 0.2686288, 0.01233734, 0, 0.9921569, 1, 1,
-0.01527781, -1.162863, -3.382127, 0, 0.9882353, 1, 1,
-0.01243407, -0.5234993, -2.114803, 0, 0.9803922, 1, 1,
-0.01039409, 0.3976951, -0.6200324, 0, 0.9764706, 1, 1,
-0.009190043, -0.4202474, -3.969315, 0, 0.9686275, 1, 1,
-0.004402964, 1.07441, -0.8536571, 0, 0.9647059, 1, 1,
-0.003095336, 0.04340433, -0.4800389, 0, 0.9568627, 1, 1,
-0.003067226, 0.281949, 0.3669193, 0, 0.9529412, 1, 1,
-0.002505053, -0.05820879, -2.182147, 0, 0.945098, 1, 1,
0.0003692725, 1.552757, -0.2357883, 0, 0.9411765, 1, 1,
0.004656676, -0.4043964, 2.541025, 0, 0.9333333, 1, 1,
0.005770351, 0.7554903, 0.3446353, 0, 0.9294118, 1, 1,
0.006704032, -1.162977, 2.820636, 0, 0.9215686, 1, 1,
0.006814268, 1.06524, 1.136068, 0, 0.9176471, 1, 1,
0.008472222, -1.303697, 2.59775, 0, 0.9098039, 1, 1,
0.009034166, 0.1911294, 0.1354059, 0, 0.9058824, 1, 1,
0.01596541, -0.9848673, 4.417768, 0, 0.8980392, 1, 1,
0.01620086, 2.189273, 0.6026394, 0, 0.8901961, 1, 1,
0.02076369, -0.1106431, 3.555938, 0, 0.8862745, 1, 1,
0.02542477, -0.7153866, 2.683841, 0, 0.8784314, 1, 1,
0.02643704, 1.045894, -0.04132812, 0, 0.8745098, 1, 1,
0.02893034, 0.27919, 1.353217, 0, 0.8666667, 1, 1,
0.02995059, 1.147241, 0.5660385, 0, 0.8627451, 1, 1,
0.03605783, 0.3079181, -1.327741, 0, 0.854902, 1, 1,
0.03938707, 1.745237, 1.194773, 0, 0.8509804, 1, 1,
0.04031192, 1.280001, -0.7916501, 0, 0.8431373, 1, 1,
0.04461759, -0.3982846, 2.804995, 0, 0.8392157, 1, 1,
0.04489526, -0.01247726, 3.834581, 0, 0.8313726, 1, 1,
0.04895256, 0.7422456, 2.130143, 0, 0.827451, 1, 1,
0.05048774, 0.1729722, 0.2707779, 0, 0.8196079, 1, 1,
0.05292197, 0.08838928, -0.1979801, 0, 0.8156863, 1, 1,
0.05674674, -0.4894454, 3.102672, 0, 0.8078431, 1, 1,
0.05758449, -0.9286813, 3.026026, 0, 0.8039216, 1, 1,
0.06042325, 2.195685, -0.1290342, 0, 0.7960784, 1, 1,
0.06078317, -0.442264, 3.466865, 0, 0.7882353, 1, 1,
0.06198701, -1.031982, 2.309114, 0, 0.7843137, 1, 1,
0.06259873, -0.9035705, 3.61161, 0, 0.7764706, 1, 1,
0.06427499, -1.446608, 0.6585086, 0, 0.772549, 1, 1,
0.0715244, 0.5367221, -1.354929, 0, 0.7647059, 1, 1,
0.07312077, 0.1344486, 0.1249425, 0, 0.7607843, 1, 1,
0.07667528, -0.4306802, 3.249232, 0, 0.7529412, 1, 1,
0.07872912, -0.001374046, 1.213369, 0, 0.7490196, 1, 1,
0.08520085, 0.3796177, -0.7027311, 0, 0.7411765, 1, 1,
0.08627947, 0.4665848, -1.127702, 0, 0.7372549, 1, 1,
0.08734666, -0.8898107, 1.867616, 0, 0.7294118, 1, 1,
0.08903343, 1.939499, 0.01342894, 0, 0.7254902, 1, 1,
0.08951776, -0.02070959, 1.419413, 0, 0.7176471, 1, 1,
0.09021429, 0.3798984, 0.8579878, 0, 0.7137255, 1, 1,
0.09253243, 0.6675466, 0.780077, 0, 0.7058824, 1, 1,
0.09268286, 0.3737747, 0.7059711, 0, 0.6980392, 1, 1,
0.0951363, 0.152022, 1.551881, 0, 0.6941177, 1, 1,
0.0956203, 0.3047545, 0.7770908, 0, 0.6862745, 1, 1,
0.09654453, 1.638523, -0.7588261, 0, 0.682353, 1, 1,
0.09823906, 2.190948, 1.037302, 0, 0.6745098, 1, 1,
0.0997992, -0.5983176, 3.230577, 0, 0.6705883, 1, 1,
0.1002764, -0.4416048, 3.175672, 0, 0.6627451, 1, 1,
0.100584, 1.259452, 0.0611559, 0, 0.6588235, 1, 1,
0.1009442, 0.9180443, -0.7286374, 0, 0.6509804, 1, 1,
0.1009952, -0.2910778, 0.8863801, 0, 0.6470588, 1, 1,
0.1132291, -0.3442537, 3.342655, 0, 0.6392157, 1, 1,
0.114411, 1.791549, 0.1625501, 0, 0.6352941, 1, 1,
0.1147696, -1.044097, 2.465701, 0, 0.627451, 1, 1,
0.1171608, -0.004447135, 0.009254572, 0, 0.6235294, 1, 1,
0.1173102, -0.09868721, 2.17094, 0, 0.6156863, 1, 1,
0.1175134, 0.4419196, 2.054112, 0, 0.6117647, 1, 1,
0.1249281, 0.03746054, 1.100152, 0, 0.6039216, 1, 1,
0.1249951, -1.030921, 0.7199975, 0, 0.5960785, 1, 1,
0.1297727, -2.100093, 3.376523, 0, 0.5921569, 1, 1,
0.1391548, -0.8495633, 3.264449, 0, 0.5843138, 1, 1,
0.1398845, -0.3396634, 2.710478, 0, 0.5803922, 1, 1,
0.1416598, 0.1183956, 1.334875, 0, 0.572549, 1, 1,
0.1419469, 0.04920252, 0.01425373, 0, 0.5686275, 1, 1,
0.1423046, 1.735656, 1.443944, 0, 0.5607843, 1, 1,
0.1461725, 2.669275, 0.6467869, 0, 0.5568628, 1, 1,
0.146822, 1.570585, -1.358237, 0, 0.5490196, 1, 1,
0.1493678, -1.278816, 3.401492, 0, 0.5450981, 1, 1,
0.1533652, 0.1485235, 2.907919, 0, 0.5372549, 1, 1,
0.1549531, 0.7537408, 0.3072911, 0, 0.5333334, 1, 1,
0.1578412, -0.6646448, 2.960201, 0, 0.5254902, 1, 1,
0.1707756, -1.787254, 4.32691, 0, 0.5215687, 1, 1,
0.1718714, -0.04350092, 1.634061, 0, 0.5137255, 1, 1,
0.172228, 0.4150557, -0.4792026, 0, 0.509804, 1, 1,
0.1724787, 0.8575389, 1.06655, 0, 0.5019608, 1, 1,
0.1737494, -1.551754, 0.5708644, 0, 0.4941176, 1, 1,
0.1744269, -0.8170979, 2.854522, 0, 0.4901961, 1, 1,
0.1783815, 1.995072, -1.828998, 0, 0.4823529, 1, 1,
0.1795503, 0.4840196, 0.2027438, 0, 0.4784314, 1, 1,
0.1849785, 0.3799943, 0.5341887, 0, 0.4705882, 1, 1,
0.1857772, -1.197115, 4.042236, 0, 0.4666667, 1, 1,
0.1867901, -1.849074, 2.789628, 0, 0.4588235, 1, 1,
0.1890896, -0.292121, 1.824926, 0, 0.454902, 1, 1,
0.1891606, 0.1333998, 1.307561, 0, 0.4470588, 1, 1,
0.189227, 0.06015382, 2.158407, 0, 0.4431373, 1, 1,
0.1898073, 0.4484577, 1.692056, 0, 0.4352941, 1, 1,
0.1926435, 2.041679, -1.674781, 0, 0.4313726, 1, 1,
0.1933283, 0.182098, 0.6566211, 0, 0.4235294, 1, 1,
0.1941301, -1.375076, 2.947001, 0, 0.4196078, 1, 1,
0.1974788, -0.5491373, 0.2894708, 0, 0.4117647, 1, 1,
0.1977322, -0.4284766, 2.651594, 0, 0.4078431, 1, 1,
0.2017184, -0.5939175, 3.224693, 0, 0.4, 1, 1,
0.21577, -1.935827, 3.177583, 0, 0.3921569, 1, 1,
0.2163846, 0.08802921, 1.467709, 0, 0.3882353, 1, 1,
0.2178944, 1.777197, 0.04815912, 0, 0.3803922, 1, 1,
0.2188564, -0.8317885, 2.764559, 0, 0.3764706, 1, 1,
0.222703, -1.03495, 4.451145, 0, 0.3686275, 1, 1,
0.2235186, 0.07283717, 3.487884, 0, 0.3647059, 1, 1,
0.2247345, 0.4755619, 1.214706, 0, 0.3568628, 1, 1,
0.2263966, 0.5654081, 0.386102, 0, 0.3529412, 1, 1,
0.2320018, -0.6463964, 2.736565, 0, 0.345098, 1, 1,
0.2326681, 0.5239792, -1.936009, 0, 0.3411765, 1, 1,
0.2348318, -0.4284777, 1.938248, 0, 0.3333333, 1, 1,
0.2356404, 1.000157, -0.3321098, 0, 0.3294118, 1, 1,
0.2365651, 0.4758866, -0.4543424, 0, 0.3215686, 1, 1,
0.2397549, 0.05946676, 0.3111582, 0, 0.3176471, 1, 1,
0.2431215, 1.675842, 0.2125816, 0, 0.3098039, 1, 1,
0.2468783, -0.05438729, 0.504925, 0, 0.3058824, 1, 1,
0.247289, 2.090895, -1.008627, 0, 0.2980392, 1, 1,
0.2488431, -1.609697, 4.196075, 0, 0.2901961, 1, 1,
0.2534392, -0.02797574, 0.7070578, 0, 0.2862745, 1, 1,
0.2544374, 0.6051596, 2.131018, 0, 0.2784314, 1, 1,
0.2608801, 0.5212832, 1.039976, 0, 0.2745098, 1, 1,
0.2665134, -0.7300103, 3.002653, 0, 0.2666667, 1, 1,
0.2666428, 1.306883, 0.4039118, 0, 0.2627451, 1, 1,
0.2693879, -0.1605853, 1.883138, 0, 0.254902, 1, 1,
0.2695926, 0.654567, -0.6252436, 0, 0.2509804, 1, 1,
0.2713956, 0.2490643, -0.4226867, 0, 0.2431373, 1, 1,
0.2744384, -1.38895, 2.852241, 0, 0.2392157, 1, 1,
0.2744573, 0.1729548, -0.3867174, 0, 0.2313726, 1, 1,
0.2750379, -0.03135666, -0.4667317, 0, 0.227451, 1, 1,
0.2856681, -0.8748385, 2.551858, 0, 0.2196078, 1, 1,
0.2878874, -0.160167, 0.6081565, 0, 0.2156863, 1, 1,
0.2904522, 0.6580548, -0.4120206, 0, 0.2078431, 1, 1,
0.2924233, -0.5285972, 2.451813, 0, 0.2039216, 1, 1,
0.3049592, 0.320951, 0.9248487, 0, 0.1960784, 1, 1,
0.3067805, 0.3437358, -0.01364008, 0, 0.1882353, 1, 1,
0.3076103, 0.2496713, 1.675667, 0, 0.1843137, 1, 1,
0.3099512, -1.739008, 2.301252, 0, 0.1764706, 1, 1,
0.320293, 1.29009, 0.317308, 0, 0.172549, 1, 1,
0.3204587, -0.2076871, 3.759981, 0, 0.1647059, 1, 1,
0.3241248, 0.9999766, 1.140691, 0, 0.1607843, 1, 1,
0.3242673, 0.8577062, 0.4475545, 0, 0.1529412, 1, 1,
0.325071, 0.8186949, 0.8104259, 0, 0.1490196, 1, 1,
0.3252388, 1.010238, 1.322819, 0, 0.1411765, 1, 1,
0.3258775, -1.235952, 2.899061, 0, 0.1372549, 1, 1,
0.3311585, -0.6810172, 2.90072, 0, 0.1294118, 1, 1,
0.3338028, 1.918006, -0.7969703, 0, 0.1254902, 1, 1,
0.3341807, -0.05280834, 3.130369, 0, 0.1176471, 1, 1,
0.336475, -0.1435288, 2.884088, 0, 0.1137255, 1, 1,
0.33691, 0.990851, 0.4398081, 0, 0.1058824, 1, 1,
0.3374154, 2.260699, 1.95332, 0, 0.09803922, 1, 1,
0.3381462, -1.640613, 1.489992, 0, 0.09411765, 1, 1,
0.3386512, 1.119221, 0.3559865, 0, 0.08627451, 1, 1,
0.3392753, -0.7694557, 2.093624, 0, 0.08235294, 1, 1,
0.3408036, 1.869304, -0.5433775, 0, 0.07450981, 1, 1,
0.3418051, 1.357478, -0.3555124, 0, 0.07058824, 1, 1,
0.3474796, -0.7561871, 0.9898418, 0, 0.0627451, 1, 1,
0.3476084, 1.779835, 0.4356243, 0, 0.05882353, 1, 1,
0.3598174, -0.7551823, 3.956079, 0, 0.05098039, 1, 1,
0.3613548, -0.7878069, 1.46934, 0, 0.04705882, 1, 1,
0.3641985, -0.7764586, 2.12457, 0, 0.03921569, 1, 1,
0.3669187, -1.41653, 2.617497, 0, 0.03529412, 1, 1,
0.3708778, -1.828694, 4.552022, 0, 0.02745098, 1, 1,
0.379169, 1.122388, -0.07868922, 0, 0.02352941, 1, 1,
0.3883387, -0.9082323, 2.329396, 0, 0.01568628, 1, 1,
0.3906026, 0.5681999, 1.613203, 0, 0.01176471, 1, 1,
0.3913625, -0.8823562, 5.237078, 0, 0.003921569, 1, 1,
0.3917784, 0.9077698, 0.1465596, 0.003921569, 0, 1, 1,
0.3974901, -1.421269, 3.65796, 0.007843138, 0, 1, 1,
0.3989957, 1.011376, -0.7277477, 0.01568628, 0, 1, 1,
0.400619, -0.3523245, 1.39214, 0.01960784, 0, 1, 1,
0.4036596, -0.443558, 2.931039, 0.02745098, 0, 1, 1,
0.4058932, -0.03047578, 2.064033, 0.03137255, 0, 1, 1,
0.4062184, -0.5860143, 3.519772, 0.03921569, 0, 1, 1,
0.4118899, 0.7488443, 0.8689079, 0.04313726, 0, 1, 1,
0.413808, -0.1584357, 2.498499, 0.05098039, 0, 1, 1,
0.4166729, -1.28508, 3.831703, 0.05490196, 0, 1, 1,
0.4200444, -0.04126942, 4.002209, 0.0627451, 0, 1, 1,
0.4203362, 0.4881429, 1.641826, 0.06666667, 0, 1, 1,
0.4220926, 0.5031614, 0.1773737, 0.07450981, 0, 1, 1,
0.4242152, -1.167349, 3.639009, 0.07843138, 0, 1, 1,
0.4293509, 0.9042143, 0.7483823, 0.08627451, 0, 1, 1,
0.4341429, -2.42608, 1.355862, 0.09019608, 0, 1, 1,
0.4345455, -0.2181599, 1.658219, 0.09803922, 0, 1, 1,
0.4362087, -0.9924083, 3.93904, 0.1058824, 0, 1, 1,
0.4385139, -1.023288, 4.123518, 0.1098039, 0, 1, 1,
0.4405147, 0.6137571, 0.9196128, 0.1176471, 0, 1, 1,
0.4441755, -1.116104, 1.853571, 0.1215686, 0, 1, 1,
0.4449157, -0.1271344, 2.850286, 0.1294118, 0, 1, 1,
0.4581951, 2.375474, 0.1166786, 0.1333333, 0, 1, 1,
0.4715778, 1.556839, 3.510207, 0.1411765, 0, 1, 1,
0.4810349, 0.8347263, 0.5790147, 0.145098, 0, 1, 1,
0.4840384, -0.8830933, 2.873631, 0.1529412, 0, 1, 1,
0.484883, 0.4791427, -1.049249, 0.1568628, 0, 1, 1,
0.4900409, 0.688006, 0.7502007, 0.1647059, 0, 1, 1,
0.4920015, -0.2377167, 1.78381, 0.1686275, 0, 1, 1,
0.4943926, -0.07004519, 1.409917, 0.1764706, 0, 1, 1,
0.4971129, 1.107186, 0.1470824, 0.1803922, 0, 1, 1,
0.4982698, 0.9190128, -0.3349411, 0.1882353, 0, 1, 1,
0.4995397, 1.130008, -0.4566375, 0.1921569, 0, 1, 1,
0.4998162, 0.252468, 0.5591496, 0.2, 0, 1, 1,
0.5023383, -1.409866, 2.579396, 0.2078431, 0, 1, 1,
0.5095447, 0.272277, 0.1193311, 0.2117647, 0, 1, 1,
0.5104338, 0.6315749, -0.2003782, 0.2196078, 0, 1, 1,
0.5155678, -1.541881, 1.245069, 0.2235294, 0, 1, 1,
0.5197101, 0.3608041, 1.694919, 0.2313726, 0, 1, 1,
0.5205193, 0.08272762, 0.9862275, 0.2352941, 0, 1, 1,
0.5222519, -0.2564983, 1.152189, 0.2431373, 0, 1, 1,
0.5223005, -0.1748486, 2.519573, 0.2470588, 0, 1, 1,
0.5268953, -1.225871, 3.297669, 0.254902, 0, 1, 1,
0.5277677, -0.6569588, 0.7659452, 0.2588235, 0, 1, 1,
0.5301876, 0.536856, 0.6146162, 0.2666667, 0, 1, 1,
0.5313873, -0.430954, 3.244977, 0.2705882, 0, 1, 1,
0.5315193, -0.1076973, 0.120337, 0.2784314, 0, 1, 1,
0.5411978, 0.9244854, -0.3770592, 0.282353, 0, 1, 1,
0.5414265, -0.3029994, 0.4957989, 0.2901961, 0, 1, 1,
0.5422405, 0.04627031, 1.861673, 0.2941177, 0, 1, 1,
0.5426347, 3.293183, 1.229601, 0.3019608, 0, 1, 1,
0.5439603, -0.2421307, 1.977444, 0.3098039, 0, 1, 1,
0.5443755, 0.2618819, 0.778092, 0.3137255, 0, 1, 1,
0.5455474, -0.7910817, 3.633014, 0.3215686, 0, 1, 1,
0.5460609, 0.9444741, 0.5054743, 0.3254902, 0, 1, 1,
0.5480187, 0.803504, -0.6877396, 0.3333333, 0, 1, 1,
0.5533375, -0.5586432, 3.356976, 0.3372549, 0, 1, 1,
0.5595886, 0.3600085, 1.289668, 0.345098, 0, 1, 1,
0.5598159, -1.254768, 2.81001, 0.3490196, 0, 1, 1,
0.5601797, 0.4123896, 0.3392611, 0.3568628, 0, 1, 1,
0.5636363, 0.6252607, 1.361441, 0.3607843, 0, 1, 1,
0.5684097, 2.462928, -1.325076, 0.3686275, 0, 1, 1,
0.5812823, 0.7171752, 1.492701, 0.372549, 0, 1, 1,
0.5821237, 0.05453456, 1.812428, 0.3803922, 0, 1, 1,
0.5828718, 0.2350626, 0.6104105, 0.3843137, 0, 1, 1,
0.5855228, 0.7591853, 1.619921, 0.3921569, 0, 1, 1,
0.5888302, -2.236908, 2.43448, 0.3960784, 0, 1, 1,
0.5894557, 0.2846276, 1.102542, 0.4039216, 0, 1, 1,
0.5945265, 0.2036435, 2.867817, 0.4117647, 0, 1, 1,
0.5954426, 0.1712175, -0.8950249, 0.4156863, 0, 1, 1,
0.6027374, -0.615965, 2.8058, 0.4235294, 0, 1, 1,
0.6032534, 0.4091429, 0.606561, 0.427451, 0, 1, 1,
0.6051761, -0.4901491, 3.102183, 0.4352941, 0, 1, 1,
0.6083038, -1.500337, 4.940661, 0.4392157, 0, 1, 1,
0.6134984, 0.3304514, 2.731847, 0.4470588, 0, 1, 1,
0.6231776, -1.275506, 1.251379, 0.4509804, 0, 1, 1,
0.6294129, -0.6796882, 1.728243, 0.4588235, 0, 1, 1,
0.6308717, 0.4378735, 0.3422676, 0.4627451, 0, 1, 1,
0.6341606, -0.5976253, 1.598824, 0.4705882, 0, 1, 1,
0.6356229, -0.7186153, 1.923478, 0.4745098, 0, 1, 1,
0.6386302, 0.227294, 3.172843, 0.4823529, 0, 1, 1,
0.6394823, 1.264738, 1.163786, 0.4862745, 0, 1, 1,
0.6413562, -0.7649696, 5.085526, 0.4941176, 0, 1, 1,
0.6424094, -0.4456311, 1.362631, 0.5019608, 0, 1, 1,
0.6429642, -0.09736248, 2.391985, 0.5058824, 0, 1, 1,
0.6440667, 2.908871, 0.255396, 0.5137255, 0, 1, 1,
0.6466756, 0.4264701, -0.2415397, 0.5176471, 0, 1, 1,
0.6489301, -0.8807042, 1.93386, 0.5254902, 0, 1, 1,
0.6490468, 0.5059071, 1.522803, 0.5294118, 0, 1, 1,
0.6497828, 0.8129835, 0.0799771, 0.5372549, 0, 1, 1,
0.6558621, 1.654245, 1.334515, 0.5411765, 0, 1, 1,
0.6583117, -0.2258322, 1.332726, 0.5490196, 0, 1, 1,
0.6590932, 1.050305, 1.298638, 0.5529412, 0, 1, 1,
0.6796159, 0.09304704, 3.101308, 0.5607843, 0, 1, 1,
0.6800261, -0.3839418, 4.072225, 0.5647059, 0, 1, 1,
0.6802939, 1.161724, 0.7999357, 0.572549, 0, 1, 1,
0.6839825, 0.9310676, 0.5421798, 0.5764706, 0, 1, 1,
0.688077, 0.6474267, 0.2484043, 0.5843138, 0, 1, 1,
0.6908491, 0.01630102, 1.309177, 0.5882353, 0, 1, 1,
0.6909549, -0.1083133, 1.22744, 0.5960785, 0, 1, 1,
0.6919236, -0.49229, 0.9297418, 0.6039216, 0, 1, 1,
0.696132, 0.1393383, 1.995893, 0.6078432, 0, 1, 1,
0.6983934, 1.25076, 0.6183758, 0.6156863, 0, 1, 1,
0.700327, 0.9834398, -0.69506, 0.6196079, 0, 1, 1,
0.7016947, 0.1862961, 0.9809426, 0.627451, 0, 1, 1,
0.7018849, 0.9393156, -0.838842, 0.6313726, 0, 1, 1,
0.7063594, 0.8032981, 1.934466, 0.6392157, 0, 1, 1,
0.7086166, 0.744297, 1.954829, 0.6431373, 0, 1, 1,
0.7089296, -0.7884136, 2.575463, 0.6509804, 0, 1, 1,
0.7100299, -0.8080266, 1.53002, 0.654902, 0, 1, 1,
0.7182444, -0.2324235, 1.898293, 0.6627451, 0, 1, 1,
0.7203353, 0.974409, 0.9935873, 0.6666667, 0, 1, 1,
0.7203922, -1.614851, 3.234453, 0.6745098, 0, 1, 1,
0.7236156, -0.6168857, 2.003557, 0.6784314, 0, 1, 1,
0.7259598, 0.2289037, 1.404456, 0.6862745, 0, 1, 1,
0.7306297, 0.4515132, 1.823265, 0.6901961, 0, 1, 1,
0.7315135, -1.335591, 3.878002, 0.6980392, 0, 1, 1,
0.7329075, 0.6483047, 2.225075, 0.7058824, 0, 1, 1,
0.7350631, 0.1743019, 1.995814, 0.7098039, 0, 1, 1,
0.7377748, -0.04452561, 1.47207, 0.7176471, 0, 1, 1,
0.7394696, -0.06419202, 2.856832, 0.7215686, 0, 1, 1,
0.7422584, 0.2033615, 3.684582, 0.7294118, 0, 1, 1,
0.7480686, -0.7725375, 3.048787, 0.7333333, 0, 1, 1,
0.7492117, -0.6878592, 1.986298, 0.7411765, 0, 1, 1,
0.7510446, 0.8211863, 1.173906, 0.7450981, 0, 1, 1,
0.7518134, 1.559806, -0.4164503, 0.7529412, 0, 1, 1,
0.7522612, 0.6678663, -0.7115205, 0.7568628, 0, 1, 1,
0.7633803, -1.457226, 2.739381, 0.7647059, 0, 1, 1,
0.7642661, -0.03807544, 0.3386508, 0.7686275, 0, 1, 1,
0.7667837, 1.238654, 0.3421703, 0.7764706, 0, 1, 1,
0.7685953, -2.310277, 2.248019, 0.7803922, 0, 1, 1,
0.7767128, 0.6484867, 0.1204896, 0.7882353, 0, 1, 1,
0.7811846, 1.257472, 0.4489578, 0.7921569, 0, 1, 1,
0.7930652, 0.5018177, 3.016697, 0.8, 0, 1, 1,
0.7960308, 0.2173288, 2.14254, 0.8078431, 0, 1, 1,
0.7962027, 0.6106588, 1.779047, 0.8117647, 0, 1, 1,
0.7996141, 0.1574675, 2.041225, 0.8196079, 0, 1, 1,
0.8022943, 0.04386607, 1.806808, 0.8235294, 0, 1, 1,
0.8085912, -0.2078432, 2.358557, 0.8313726, 0, 1, 1,
0.8118307, 0.07834749, 1.029175, 0.8352941, 0, 1, 1,
0.8136027, 0.1429421, 1.694385, 0.8431373, 0, 1, 1,
0.8230813, 1.731388, 0.6893067, 0.8470588, 0, 1, 1,
0.8279629, 1.49324, 0.9925398, 0.854902, 0, 1, 1,
0.8308071, 0.3541336, -0.3922037, 0.8588235, 0, 1, 1,
0.8316352, -0.07854053, 1.250488, 0.8666667, 0, 1, 1,
0.8339852, -1.066226, 3.611073, 0.8705882, 0, 1, 1,
0.8400448, -0.4828309, 2.128208, 0.8784314, 0, 1, 1,
0.8411866, -0.1361153, 2.153584, 0.8823529, 0, 1, 1,
0.8444896, 1.45571, 1.029873, 0.8901961, 0, 1, 1,
0.8565953, -0.8097011, 3.294962, 0.8941177, 0, 1, 1,
0.8611456, -1.913367, 1.584613, 0.9019608, 0, 1, 1,
0.8636447, -0.4260635, 1.963632, 0.9098039, 0, 1, 1,
0.8667484, -0.8529561, 1.992243, 0.9137255, 0, 1, 1,
0.8718807, -0.1738489, 2.000641, 0.9215686, 0, 1, 1,
0.8723531, -0.8055488, 2.11237, 0.9254902, 0, 1, 1,
0.8754938, -1.258561, 0.6999078, 0.9333333, 0, 1, 1,
0.8810554, -0.6663034, 1.527066, 0.9372549, 0, 1, 1,
0.8859413, 1.240091, 0.713244, 0.945098, 0, 1, 1,
0.9066321, -2.614318, 3.323663, 0.9490196, 0, 1, 1,
0.9075028, 0.06692531, 2.487252, 0.9568627, 0, 1, 1,
0.9082143, -0.08256438, 2.396174, 0.9607843, 0, 1, 1,
0.9082263, -1.030112, 1.456564, 0.9686275, 0, 1, 1,
0.9090948, -0.6310344, 1.465897, 0.972549, 0, 1, 1,
0.9185733, 0.6036109, 3.40538, 0.9803922, 0, 1, 1,
0.9218123, 1.457632, 0.8626952, 0.9843137, 0, 1, 1,
0.9268785, 0.4963779, 0.7950506, 0.9921569, 0, 1, 1,
0.9293486, -0.1913923, 0.98375, 0.9960784, 0, 1, 1,
0.9317016, -0.4989173, 2.482988, 1, 0, 0.9960784, 1,
0.9343101, -1.242089, 2.323101, 1, 0, 0.9882353, 1,
0.9391098, -0.795006, 1.413704, 1, 0, 0.9843137, 1,
0.9413164, 1.461255, 0.01375691, 1, 0, 0.9764706, 1,
0.946224, 1.037693, -1.34002, 1, 0, 0.972549, 1,
0.9660006, 0.9043064, 0.2787085, 1, 0, 0.9647059, 1,
0.9715937, 0.9266883, 1.659045, 1, 0, 0.9607843, 1,
0.9732173, -0.4579887, 0.797761, 1, 0, 0.9529412, 1,
0.980962, -1.14878, 1.474067, 1, 0, 0.9490196, 1,
0.9828379, -0.03396215, 2.428988, 1, 0, 0.9411765, 1,
0.9870955, -1.432609, 0.4391305, 1, 0, 0.9372549, 1,
0.9874029, 1.000478, 0.2219902, 1, 0, 0.9294118, 1,
0.9942685, -0.2287149, 2.025554, 1, 0, 0.9254902, 1,
0.998653, -0.3303705, 2.322663, 1, 0, 0.9176471, 1,
0.99898, 0.8066607, -0.7498516, 1, 0, 0.9137255, 1,
1.006034, -1.36576, 2.921319, 1, 0, 0.9058824, 1,
1.013086, 1.137877, 1.430872, 1, 0, 0.9019608, 1,
1.013662, -0.3993151, 1.152367, 1, 0, 0.8941177, 1,
1.014943, -0.7600627, 3.022066, 1, 0, 0.8862745, 1,
1.02201, 1.271456, 0.7052758, 1, 0, 0.8823529, 1,
1.025733, -0.8977745, 1.10956, 1, 0, 0.8745098, 1,
1.039477, -1.050624, 2.385805, 1, 0, 0.8705882, 1,
1.043889, -0.6543039, 1.13877, 1, 0, 0.8627451, 1,
1.046107, 0.2294517, 0.7838845, 1, 0, 0.8588235, 1,
1.051553, 2.153117, 1.45294, 1, 0, 0.8509804, 1,
1.06462, -0.5417179, 1.688564, 1, 0, 0.8470588, 1,
1.066046, -1.356794, 1.191222, 1, 0, 0.8392157, 1,
1.066281, -1.602289, 3.206209, 1, 0, 0.8352941, 1,
1.06745, 0.6051416, 1.571828, 1, 0, 0.827451, 1,
1.068061, 1.959897, -0.04411962, 1, 0, 0.8235294, 1,
1.068356, -0.3711073, 1.970431, 1, 0, 0.8156863, 1,
1.078865, -0.7414667, 1.4723, 1, 0, 0.8117647, 1,
1.080561, -1.532211, 2.604634, 1, 0, 0.8039216, 1,
1.085958, 0.6965861, 0.7893263, 1, 0, 0.7960784, 1,
1.091308, -0.2755904, 2.521452, 1, 0, 0.7921569, 1,
1.09217, -1.03915, 1.476482, 1, 0, 0.7843137, 1,
1.094122, -1.223267, 1.440159, 1, 0, 0.7803922, 1,
1.099263, 0.3244649, 1.237297, 1, 0, 0.772549, 1,
1.111308, 1.481858, 0.6815172, 1, 0, 0.7686275, 1,
1.111444, -0.02685468, 0.2841365, 1, 0, 0.7607843, 1,
1.126606, -0.6769522, 2.457575, 1, 0, 0.7568628, 1,
1.130847, 0.2706032, 1.417363, 1, 0, 0.7490196, 1,
1.13632, 0.7913864, 2.65318, 1, 0, 0.7450981, 1,
1.136333, -1.828448, 3.165357, 1, 0, 0.7372549, 1,
1.138782, -0.2509772, 2.496263, 1, 0, 0.7333333, 1,
1.150226, -0.4049831, 0.772182, 1, 0, 0.7254902, 1,
1.151532, -0.8037227, 1.763574, 1, 0, 0.7215686, 1,
1.154194, 0.7075042, 1.810472, 1, 0, 0.7137255, 1,
1.157011, -0.2505213, 2.616286, 1, 0, 0.7098039, 1,
1.162106, -2.883343, 2.541747, 1, 0, 0.7019608, 1,
1.162729, -1.007336, 2.285002, 1, 0, 0.6941177, 1,
1.163769, -1.395354, 0.2580335, 1, 0, 0.6901961, 1,
1.163984, -0.1046508, 1.06602, 1, 0, 0.682353, 1,
1.17797, -0.9299496, 2.818258, 1, 0, 0.6784314, 1,
1.179568, 0.1931406, 1.877448, 1, 0, 0.6705883, 1,
1.182452, -0.9349609, 1.555918, 1, 0, 0.6666667, 1,
1.184101, -0.6843433, 2.50296, 1, 0, 0.6588235, 1,
1.186187, 0.5917686, 2.349654, 1, 0, 0.654902, 1,
1.209112, -0.7286011, 3.38832, 1, 0, 0.6470588, 1,
1.213569, 0.006194749, 2.22434, 1, 0, 0.6431373, 1,
1.214641, 0.003754344, 0.7441415, 1, 0, 0.6352941, 1,
1.215566, 0.4365984, 1.331003, 1, 0, 0.6313726, 1,
1.221294, -0.7865834, 2.084288, 1, 0, 0.6235294, 1,
1.233577, 0.2464802, 0.3556632, 1, 0, 0.6196079, 1,
1.237439, -1.313395, 2.664449, 1, 0, 0.6117647, 1,
1.246297, -1.145082, 4.294546, 1, 0, 0.6078432, 1,
1.249682, -1.449755, 1.738026, 1, 0, 0.6, 1,
1.254353, -0.1366904, 0.8859188, 1, 0, 0.5921569, 1,
1.25771, -0.2343953, 2.618785, 1, 0, 0.5882353, 1,
1.272269, 1.059196, 2.605002, 1, 0, 0.5803922, 1,
1.274553, 1.856027, 0.4785293, 1, 0, 0.5764706, 1,
1.278057, 0.02764515, 0.5556944, 1, 0, 0.5686275, 1,
1.27852, 1.185998, 0.7981513, 1, 0, 0.5647059, 1,
1.288246, -0.7951641, 1.793923, 1, 0, 0.5568628, 1,
1.290969, -0.692129, -0.7146288, 1, 0, 0.5529412, 1,
1.302527, -0.254706, 1.766135, 1, 0, 0.5450981, 1,
1.304239, -0.09969106, 0.0682769, 1, 0, 0.5411765, 1,
1.306376, -0.1167099, 1.307828, 1, 0, 0.5333334, 1,
1.306766, -0.2042275, 1.140311, 1, 0, 0.5294118, 1,
1.32094, -0.5617629, 0.7262505, 1, 0, 0.5215687, 1,
1.346846, 0.04571342, 0.9138047, 1, 0, 0.5176471, 1,
1.367713, 1.489104, 0.7471234, 1, 0, 0.509804, 1,
1.370609, 0.3303318, 1.252639, 1, 0, 0.5058824, 1,
1.372007, 0.2072392, 1.380242, 1, 0, 0.4980392, 1,
1.382005, -0.1230543, 1.756482, 1, 0, 0.4901961, 1,
1.392391, 0.5105851, 0.2157231, 1, 0, 0.4862745, 1,
1.393095, -0.8561032, 1.948591, 1, 0, 0.4784314, 1,
1.394225, -1.127359, 1.675013, 1, 0, 0.4745098, 1,
1.400088, 0.225196, -0.9768327, 1, 0, 0.4666667, 1,
1.401338, -0.04173776, 1.388078, 1, 0, 0.4627451, 1,
1.412838, 0.203182, 1.894553, 1, 0, 0.454902, 1,
1.41662, 0.4455334, 3.520622, 1, 0, 0.4509804, 1,
1.416879, 0.4711323, 0.9381826, 1, 0, 0.4431373, 1,
1.417505, 0.1828995, 2.068179, 1, 0, 0.4392157, 1,
1.426803, -1.019124, 2.533176, 1, 0, 0.4313726, 1,
1.450794, -0.0799009, 1.544051, 1, 0, 0.427451, 1,
1.459078, 0.2306655, 0.7099321, 1, 0, 0.4196078, 1,
1.470777, -0.1177571, 1.701569, 1, 0, 0.4156863, 1,
1.476713, -2.267299, 2.198785, 1, 0, 0.4078431, 1,
1.484832, 0.3611706, 1.112819, 1, 0, 0.4039216, 1,
1.485086, -0.5803575, 1.574841, 1, 0, 0.3960784, 1,
1.487407, 1.2109, 1.361341, 1, 0, 0.3882353, 1,
1.501762, -0.09919751, 2.27664, 1, 0, 0.3843137, 1,
1.516089, -1.277469, 1.935294, 1, 0, 0.3764706, 1,
1.520516, -0.05987949, 0.4682991, 1, 0, 0.372549, 1,
1.547086, -0.2665119, 1.227197, 1, 0, 0.3647059, 1,
1.563241, 0.5140326, -0.3327377, 1, 0, 0.3607843, 1,
1.599352, 1.446824, 1.02524, 1, 0, 0.3529412, 1,
1.604096, 0.02158737, 2.758458, 1, 0, 0.3490196, 1,
1.605684, 0.2246622, 2.311046, 1, 0, 0.3411765, 1,
1.621869, 1.155779, 2.578235, 1, 0, 0.3372549, 1,
1.641778, 0.2463147, 0.7428043, 1, 0, 0.3294118, 1,
1.649423, -0.4475849, 3.038022, 1, 0, 0.3254902, 1,
1.659542, 0.9768854, 1.692094, 1, 0, 0.3176471, 1,
1.661829, -0.5623274, 1.640982, 1, 0, 0.3137255, 1,
1.666857, -0.02160161, -0.04474026, 1, 0, 0.3058824, 1,
1.698976, 0.09916293, 2.015167, 1, 0, 0.2980392, 1,
1.705209, 1.199956, 0.7386881, 1, 0, 0.2941177, 1,
1.712085, -0.9437437, 1.043406, 1, 0, 0.2862745, 1,
1.712224, 1.527313, 0.4473881, 1, 0, 0.282353, 1,
1.73317, -2.185616, 2.424927, 1, 0, 0.2745098, 1,
1.750245, -0.009250099, 1.582051, 1, 0, 0.2705882, 1,
1.811548, 0.04737851, -0.3308112, 1, 0, 0.2627451, 1,
1.838289, 0.4070401, 1.542253, 1, 0, 0.2588235, 1,
1.855453, -0.9096697, 0.9849438, 1, 0, 0.2509804, 1,
1.858563, -0.7567155, 0.3873992, 1, 0, 0.2470588, 1,
1.861771, 0.05864869, 1.847905, 1, 0, 0.2392157, 1,
1.885445, -2.126047, 2.336973, 1, 0, 0.2352941, 1,
1.899527, -0.9767585, 0.9282252, 1, 0, 0.227451, 1,
1.908304, 0.04813109, 1.188884, 1, 0, 0.2235294, 1,
1.920924, -0.9691768, 1.596632, 1, 0, 0.2156863, 1,
1.938574, 1.626191, 1.106646, 1, 0, 0.2117647, 1,
1.940551, -0.2495194, 3.423749, 1, 0, 0.2039216, 1,
1.95739, -0.2144974, 3.051858, 1, 0, 0.1960784, 1,
1.960338, -1.732063, 3.110607, 1, 0, 0.1921569, 1,
1.960981, 0.8164192, 1.770783, 1, 0, 0.1843137, 1,
1.961435, 2.267031, -0.07770139, 1, 0, 0.1803922, 1,
1.972832, 0.09371617, 2.165496, 1, 0, 0.172549, 1,
2.009895, 1.434386, 1.305133, 1, 0, 0.1686275, 1,
2.014484, 1.270171, -0.141637, 1, 0, 0.1607843, 1,
2.016735, -0.8489261, 1.047359, 1, 0, 0.1568628, 1,
2.035435, -1.029534, 1.305423, 1, 0, 0.1490196, 1,
2.050425, -0.3235687, 1.36552, 1, 0, 0.145098, 1,
2.051971, 0.0661981, 2.194812, 1, 0, 0.1372549, 1,
2.063433, 0.5340937, 0.6004769, 1, 0, 0.1333333, 1,
2.078739, 0.2525481, 1.89, 1, 0, 0.1254902, 1,
2.101201, -2.460599, 2.035698, 1, 0, 0.1215686, 1,
2.106371, 1.232312, 0.5497231, 1, 0, 0.1137255, 1,
2.119998, -0.2636538, 1.882408, 1, 0, 0.1098039, 1,
2.152607, 0.4865479, 1.908541, 1, 0, 0.1019608, 1,
2.18571, -0.6126262, 1.856305, 1, 0, 0.09411765, 1,
2.221175, -0.6478404, 2.120547, 1, 0, 0.09019608, 1,
2.256996, 0.6268713, 2.797695, 1, 0, 0.08235294, 1,
2.295124, 1.050317, 2.589438, 1, 0, 0.07843138, 1,
2.39689, 1.454555, 0.08907885, 1, 0, 0.07058824, 1,
2.409626, -0.9137551, 2.565761, 1, 0, 0.06666667, 1,
2.424665, 0.6260952, -0.6690985, 1, 0, 0.05882353, 1,
2.474848, 0.2558793, 2.160849, 1, 0, 0.05490196, 1,
2.476336, -0.2616293, 2.115883, 1, 0, 0.04705882, 1,
2.494261, 0.137678, 1.935922, 1, 0, 0.04313726, 1,
2.56423, -1.521373, 1.089741, 1, 0, 0.03529412, 1,
2.573378, -0.1455812, 0.8738548, 1, 0, 0.03137255, 1,
2.656928, 0.2970443, 1.113987, 1, 0, 0.02352941, 1,
2.82504, 1.203843, 2.308304, 1, 0, 0.01960784, 1,
2.860711, -0.3905109, 1.359224, 1, 0, 0.01176471, 1,
3.053704, -0.8431579, 0.4750764, 1, 0, 0.007843138, 1
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
-0.01072395, -4.369952, -7.138499, 0, -0.5, 0.5, 0.5,
-0.01072395, -4.369952, -7.138499, 1, -0.5, 0.5, 0.5,
-0.01072395, -4.369952, -7.138499, 1, 1.5, 0.5, 0.5,
-0.01072395, -4.369952, -7.138499, 0, 1.5, 0.5, 0.5
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
-4.113993, 0.01693881, -7.138499, 0, -0.5, 0.5, 0.5,
-4.113993, 0.01693881, -7.138499, 1, -0.5, 0.5, 0.5,
-4.113993, 0.01693881, -7.138499, 1, 1.5, 0.5, 0.5,
-4.113993, 0.01693881, -7.138499, 0, 1.5, 0.5, 0.5
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
-4.113993, -4.369952, -0.05389142, 0, -0.5, 0.5, 0.5,
-4.113993, -4.369952, -0.05389142, 1, -0.5, 0.5, 0.5,
-4.113993, -4.369952, -0.05389142, 1, 1.5, 0.5, 0.5,
-4.113993, -4.369952, -0.05389142, 0, 1.5, 0.5, 0.5
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
-3, -3.357593, -5.50359,
3, -3.357593, -5.50359,
-3, -3.357593, -5.50359,
-3, -3.52632, -5.776074,
-2, -3.357593, -5.50359,
-2, -3.52632, -5.776074,
-1, -3.357593, -5.50359,
-1, -3.52632, -5.776074,
0, -3.357593, -5.50359,
0, -3.52632, -5.776074,
1, -3.357593, -5.50359,
1, -3.52632, -5.776074,
2, -3.357593, -5.50359,
2, -3.52632, -5.776074,
3, -3.357593, -5.50359,
3, -3.52632, -5.776074
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
-3, -3.863773, -6.321044, 0, -0.5, 0.5, 0.5,
-3, -3.863773, -6.321044, 1, -0.5, 0.5, 0.5,
-3, -3.863773, -6.321044, 1, 1.5, 0.5, 0.5,
-3, -3.863773, -6.321044, 0, 1.5, 0.5, 0.5,
-2, -3.863773, -6.321044, 0, -0.5, 0.5, 0.5,
-2, -3.863773, -6.321044, 1, -0.5, 0.5, 0.5,
-2, -3.863773, -6.321044, 1, 1.5, 0.5, 0.5,
-2, -3.863773, -6.321044, 0, 1.5, 0.5, 0.5,
-1, -3.863773, -6.321044, 0, -0.5, 0.5, 0.5,
-1, -3.863773, -6.321044, 1, -0.5, 0.5, 0.5,
-1, -3.863773, -6.321044, 1, 1.5, 0.5, 0.5,
-1, -3.863773, -6.321044, 0, 1.5, 0.5, 0.5,
0, -3.863773, -6.321044, 0, -0.5, 0.5, 0.5,
0, -3.863773, -6.321044, 1, -0.5, 0.5, 0.5,
0, -3.863773, -6.321044, 1, 1.5, 0.5, 0.5,
0, -3.863773, -6.321044, 0, 1.5, 0.5, 0.5,
1, -3.863773, -6.321044, 0, -0.5, 0.5, 0.5,
1, -3.863773, -6.321044, 1, -0.5, 0.5, 0.5,
1, -3.863773, -6.321044, 1, 1.5, 0.5, 0.5,
1, -3.863773, -6.321044, 0, 1.5, 0.5, 0.5,
2, -3.863773, -6.321044, 0, -0.5, 0.5, 0.5,
2, -3.863773, -6.321044, 1, -0.5, 0.5, 0.5,
2, -3.863773, -6.321044, 1, 1.5, 0.5, 0.5,
2, -3.863773, -6.321044, 0, 1.5, 0.5, 0.5,
3, -3.863773, -6.321044, 0, -0.5, 0.5, 0.5,
3, -3.863773, -6.321044, 1, -0.5, 0.5, 0.5,
3, -3.863773, -6.321044, 1, 1.5, 0.5, 0.5,
3, -3.863773, -6.321044, 0, 1.5, 0.5, 0.5
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
-3.167084, -3, -5.50359,
-3.167084, 3, -5.50359,
-3.167084, -3, -5.50359,
-3.324903, -3, -5.776074,
-3.167084, -2, -5.50359,
-3.324903, -2, -5.776074,
-3.167084, -1, -5.50359,
-3.324903, -1, -5.776074,
-3.167084, 0, -5.50359,
-3.324903, 0, -5.776074,
-3.167084, 1, -5.50359,
-3.324903, 1, -5.776074,
-3.167084, 2, -5.50359,
-3.324903, 2, -5.776074,
-3.167084, 3, -5.50359,
-3.324903, 3, -5.776074
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
-3.640539, -3, -6.321044, 0, -0.5, 0.5, 0.5,
-3.640539, -3, -6.321044, 1, -0.5, 0.5, 0.5,
-3.640539, -3, -6.321044, 1, 1.5, 0.5, 0.5,
-3.640539, -3, -6.321044, 0, 1.5, 0.5, 0.5,
-3.640539, -2, -6.321044, 0, -0.5, 0.5, 0.5,
-3.640539, -2, -6.321044, 1, -0.5, 0.5, 0.5,
-3.640539, -2, -6.321044, 1, 1.5, 0.5, 0.5,
-3.640539, -2, -6.321044, 0, 1.5, 0.5, 0.5,
-3.640539, -1, -6.321044, 0, -0.5, 0.5, 0.5,
-3.640539, -1, -6.321044, 1, -0.5, 0.5, 0.5,
-3.640539, -1, -6.321044, 1, 1.5, 0.5, 0.5,
-3.640539, -1, -6.321044, 0, 1.5, 0.5, 0.5,
-3.640539, 0, -6.321044, 0, -0.5, 0.5, 0.5,
-3.640539, 0, -6.321044, 1, -0.5, 0.5, 0.5,
-3.640539, 0, -6.321044, 1, 1.5, 0.5, 0.5,
-3.640539, 0, -6.321044, 0, 1.5, 0.5, 0.5,
-3.640539, 1, -6.321044, 0, -0.5, 0.5, 0.5,
-3.640539, 1, -6.321044, 1, -0.5, 0.5, 0.5,
-3.640539, 1, -6.321044, 1, 1.5, 0.5, 0.5,
-3.640539, 1, -6.321044, 0, 1.5, 0.5, 0.5,
-3.640539, 2, -6.321044, 0, -0.5, 0.5, 0.5,
-3.640539, 2, -6.321044, 1, -0.5, 0.5, 0.5,
-3.640539, 2, -6.321044, 1, 1.5, 0.5, 0.5,
-3.640539, 2, -6.321044, 0, 1.5, 0.5, 0.5,
-3.640539, 3, -6.321044, 0, -0.5, 0.5, 0.5,
-3.640539, 3, -6.321044, 1, -0.5, 0.5, 0.5,
-3.640539, 3, -6.321044, 1, 1.5, 0.5, 0.5,
-3.640539, 3, -6.321044, 0, 1.5, 0.5, 0.5
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
-3.167084, -3.357593, -4,
-3.167084, -3.357593, 4,
-3.167084, -3.357593, -4,
-3.324903, -3.52632, -4,
-3.167084, -3.357593, -2,
-3.324903, -3.52632, -2,
-3.167084, -3.357593, 0,
-3.324903, -3.52632, 0,
-3.167084, -3.357593, 2,
-3.324903, -3.52632, 2,
-3.167084, -3.357593, 4,
-3.324903, -3.52632, 4
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
-3.640539, -3.863773, -4, 0, -0.5, 0.5, 0.5,
-3.640539, -3.863773, -4, 1, -0.5, 0.5, 0.5,
-3.640539, -3.863773, -4, 1, 1.5, 0.5, 0.5,
-3.640539, -3.863773, -4, 0, 1.5, 0.5, 0.5,
-3.640539, -3.863773, -2, 0, -0.5, 0.5, 0.5,
-3.640539, -3.863773, -2, 1, -0.5, 0.5, 0.5,
-3.640539, -3.863773, -2, 1, 1.5, 0.5, 0.5,
-3.640539, -3.863773, -2, 0, 1.5, 0.5, 0.5,
-3.640539, -3.863773, 0, 0, -0.5, 0.5, 0.5,
-3.640539, -3.863773, 0, 1, -0.5, 0.5, 0.5,
-3.640539, -3.863773, 0, 1, 1.5, 0.5, 0.5,
-3.640539, -3.863773, 0, 0, 1.5, 0.5, 0.5,
-3.640539, -3.863773, 2, 0, -0.5, 0.5, 0.5,
-3.640539, -3.863773, 2, 1, -0.5, 0.5, 0.5,
-3.640539, -3.863773, 2, 1, 1.5, 0.5, 0.5,
-3.640539, -3.863773, 2, 0, 1.5, 0.5, 0.5,
-3.640539, -3.863773, 4, 0, -0.5, 0.5, 0.5,
-3.640539, -3.863773, 4, 1, -0.5, 0.5, 0.5,
-3.640539, -3.863773, 4, 1, 1.5, 0.5, 0.5,
-3.640539, -3.863773, 4, 0, 1.5, 0.5, 0.5
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
-3.167084, -3.357593, -5.50359,
-3.167084, 3.39147, -5.50359,
-3.167084, -3.357593, 5.395807,
-3.167084, 3.39147, 5.395807,
-3.167084, -3.357593, -5.50359,
-3.167084, -3.357593, 5.395807,
-3.167084, 3.39147, -5.50359,
-3.167084, 3.39147, 5.395807,
-3.167084, -3.357593, -5.50359,
3.145637, -3.357593, -5.50359,
-3.167084, -3.357593, 5.395807,
3.145637, -3.357593, 5.395807,
-3.167084, 3.39147, -5.50359,
3.145637, 3.39147, -5.50359,
-3.167084, 3.39147, 5.395807,
3.145637, 3.39147, 5.395807,
3.145637, -3.357593, -5.50359,
3.145637, 3.39147, -5.50359,
3.145637, -3.357593, 5.395807,
3.145637, 3.39147, 5.395807,
3.145637, -3.357593, -5.50359,
3.145637, -3.357593, 5.395807,
3.145637, 3.39147, -5.50359,
3.145637, 3.39147, 5.395807
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
var radius = 7.630453;
var distance = 33.94875;
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
mvMatrix.translate( 0.01072395, -0.01693881, 0.05389142 );
mvMatrix.scale( 1.306916, 1.222421, 0.7569405 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.94875);
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
thiadiazine-2-thione<-read.table("thiadiazine-2-thione.xyz")
```

```
## Error in read.table("thiadiazine-2-thione.xyz"): no lines available in input
```

```r
x<-thiadiazine-2-thione$V2
```

```
## Error in eval(expr, envir, enclos): object 'thiadiazine' not found
```

```r
y<-thiadiazine-2-thione$V3
```

```
## Error in eval(expr, envir, enclos): object 'thiadiazine' not found
```

```r
z<-thiadiazine-2-thione$V4
```

```
## Error in eval(expr, envir, enclos): object 'thiadiazine' not found
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
-3.075152, -0.9417061, -2.524561, 0, 0, 1, 1, 1,
-2.940392, -0.8781184, -0.5489582, 1, 0, 0, 1, 1,
-2.8538, -0.1264684, -1.384493, 1, 0, 0, 1, 1,
-2.842358, 0.2520649, -0.7641318, 1, 0, 0, 1, 1,
-2.699827, 0.1818993, -3.587257, 1, 0, 0, 1, 1,
-2.614306, 1.289519, -0.6205006, 1, 0, 0, 1, 1,
-2.587001, 0.757408, -1.214337, 0, 0, 0, 1, 1,
-2.562333, 0.683477, -1.34877, 0, 0, 0, 1, 1,
-2.55251, 0.4067188, -1.741684, 0, 0, 0, 1, 1,
-2.515084, 0.7195127, -3.585537, 0, 0, 0, 1, 1,
-2.470502, -0.4922702, -0.441048, 0, 0, 0, 1, 1,
-2.461981, -2.543996, -1.875363, 0, 0, 0, 1, 1,
-2.430506, 0.7470579, 0.9029001, 0, 0, 0, 1, 1,
-2.419703, 1.399526, -0.9271004, 1, 1, 1, 1, 1,
-2.283944, -0.09516884, -2.43266, 1, 1, 1, 1, 1,
-2.271298, -0.122388, -1.783218, 1, 1, 1, 1, 1,
-2.245502, 1.212324, -1.178118, 1, 1, 1, 1, 1,
-2.237085, -0.4943571, -1.553504, 1, 1, 1, 1, 1,
-2.174405, -0.01944459, 0.3991806, 1, 1, 1, 1, 1,
-2.168419, -2.058905, -4.584105, 1, 1, 1, 1, 1,
-2.150164, 0.8773279, -1.979662, 1, 1, 1, 1, 1,
-2.106741, 0.01832603, -2.566772, 1, 1, 1, 1, 1,
-2.105464, 0.07074195, -1.051489, 1, 1, 1, 1, 1,
-2.075295, -0.630492, -4.014259, 1, 1, 1, 1, 1,
-2.061867, -0.6525254, -1.499496, 1, 1, 1, 1, 1,
-2.056789, 0.2431992, -0.1732869, 1, 1, 1, 1, 1,
-2.046585, -1.032736, 0.2008723, 1, 1, 1, 1, 1,
-2.04111, -0.64074, -0.857024, 1, 1, 1, 1, 1,
-2.024776, -0.4489758, -1.048057, 0, 0, 1, 1, 1,
-2.023134, 0.0481176, -3.670521, 1, 0, 0, 1, 1,
-2.02084, -0.2050072, -2.738675, 1, 0, 0, 1, 1,
-1.998452, 0.8821147, -0.4191948, 1, 0, 0, 1, 1,
-1.986926, 0.4209476, -1.417084, 1, 0, 0, 1, 1,
-1.968146, -0.1662462, -1.597861, 1, 0, 0, 1, 1,
-1.910342, -0.1804182, -1.595114, 0, 0, 0, 1, 1,
-1.905212, -0.6934932, -1.865263, 0, 0, 0, 1, 1,
-1.894451, -0.3084842, -0.1811547, 0, 0, 0, 1, 1,
-1.849551, -0.2786384, -1.793615, 0, 0, 0, 1, 1,
-1.832438, -0.2423151, -0.8553697, 0, 0, 0, 1, 1,
-1.827145, 0.2198715, -1.516572, 0, 0, 0, 1, 1,
-1.808671, 0.3766266, -1.572161, 0, 0, 0, 1, 1,
-1.797853, 0.5686904, -1.821141, 1, 1, 1, 1, 1,
-1.796845, 0.5107235, -2.409935, 1, 1, 1, 1, 1,
-1.794098, 1.588501, -0.9252617, 1, 1, 1, 1, 1,
-1.787282, 1.348933, -1.593945, 1, 1, 1, 1, 1,
-1.785661, 0.1274996, -0.5350818, 1, 1, 1, 1, 1,
-1.782681, 1.169921, -1.000659, 1, 1, 1, 1, 1,
-1.771212, 1.843256, -1.679335, 1, 1, 1, 1, 1,
-1.765368, 0.1271582, -4.31902, 1, 1, 1, 1, 1,
-1.764986, 0.6483492, -0.4425452, 1, 1, 1, 1, 1,
-1.758195, 0.2371065, -0.9498548, 1, 1, 1, 1, 1,
-1.755152, 0.8495345, -1.196424, 1, 1, 1, 1, 1,
-1.72701, -0.6649664, -3.938822, 1, 1, 1, 1, 1,
-1.725054, -1.081286, -0.1882768, 1, 1, 1, 1, 1,
-1.706766, 1.407178, -2.735089, 1, 1, 1, 1, 1,
-1.666296, 1.811743, 0.6103249, 1, 1, 1, 1, 1,
-1.661018, -0.4743376, -1.530118, 0, 0, 1, 1, 1,
-1.651692, -0.8013688, -1.467277, 1, 0, 0, 1, 1,
-1.650816, 0.1401273, -1.304354, 1, 0, 0, 1, 1,
-1.648196, -0.4127187, -3.00854, 1, 0, 0, 1, 1,
-1.643905, 1.23753, -0.466543, 1, 0, 0, 1, 1,
-1.599245, -0.527859, -1.139938, 1, 0, 0, 1, 1,
-1.575374, 0.2832187, -2.144151, 0, 0, 0, 1, 1,
-1.561475, -0.8745912, -3.485105, 0, 0, 0, 1, 1,
-1.561315, -1.39734, -1.312041, 0, 0, 0, 1, 1,
-1.560442, 0.8549294, -1.635804, 0, 0, 0, 1, 1,
-1.558169, -1.363775, -2.564439, 0, 0, 0, 1, 1,
-1.539585, -3.259305, -2.848333, 0, 0, 0, 1, 1,
-1.53877, -0.3730755, -0.04278708, 0, 0, 0, 1, 1,
-1.531646, -0.8246118, -1.133968, 1, 1, 1, 1, 1,
-1.530019, -2.119709, -0.9937385, 1, 1, 1, 1, 1,
-1.522156, -2.826745, -4.32957, 1, 1, 1, 1, 1,
-1.519283, -0.9756013, -1.165247, 1, 1, 1, 1, 1,
-1.518146, 0.07470841, -2.798043, 1, 1, 1, 1, 1,
-1.510939, 0.6644003, -1.074291, 1, 1, 1, 1, 1,
-1.499746, 0.2211149, -1.70274, 1, 1, 1, 1, 1,
-1.49966, 0.104709, -0.887552, 1, 1, 1, 1, 1,
-1.497392, -0.2645912, -2.922024, 1, 1, 1, 1, 1,
-1.467959, -1.262833, -3.042762, 1, 1, 1, 1, 1,
-1.467364, -1.133124, -3.483743, 1, 1, 1, 1, 1,
-1.465969, -0.5362018, -3.143273, 1, 1, 1, 1, 1,
-1.460132, -0.6943492, -3.396755, 1, 1, 1, 1, 1,
-1.459025, -0.2087225, -2.807573, 1, 1, 1, 1, 1,
-1.442566, -1.872633, -3.679158, 1, 1, 1, 1, 1,
-1.421413, -0.6332804, -0.6940755, 0, 0, 1, 1, 1,
-1.374711, 1.991831, -1.16634, 1, 0, 0, 1, 1,
-1.369372, 0.8583178, 0.6425992, 1, 0, 0, 1, 1,
-1.358404, 1.358646, -0.5340687, 1, 0, 0, 1, 1,
-1.353632, 0.04367831, -2.463358, 1, 0, 0, 1, 1,
-1.353166, -0.301379, -1.11309, 1, 0, 0, 1, 1,
-1.346049, 0.8348409, 0.9816141, 0, 0, 0, 1, 1,
-1.334717, 0.637279, -1.764671, 0, 0, 0, 1, 1,
-1.315551, 2.063288, -1.052687, 0, 0, 0, 1, 1,
-1.299824, -0.6894591, -3.771981, 0, 0, 0, 1, 1,
-1.291895, -1.134509, -2.711676, 0, 0, 0, 1, 1,
-1.286204, 0.9542907, -0.4615105, 0, 0, 0, 1, 1,
-1.281871, 0.289205, -2.053765, 0, 0, 0, 1, 1,
-1.28142, -0.7831565, -3.226339, 1, 1, 1, 1, 1,
-1.281135, 0.1626846, -1.418119, 1, 1, 1, 1, 1,
-1.270786, 0.3547429, -0.882699, 1, 1, 1, 1, 1,
-1.260085, 0.5487481, -1.244866, 1, 1, 1, 1, 1,
-1.250413, 0.258278, -2.070368, 1, 1, 1, 1, 1,
-1.247267, -0.9583518, -2.410546, 1, 1, 1, 1, 1,
-1.238782, 0.3343719, -2.363749, 1, 1, 1, 1, 1,
-1.22756, 0.3449427, -1.5772, 1, 1, 1, 1, 1,
-1.227232, -0.4722151, -1.262364, 1, 1, 1, 1, 1,
-1.224878, -1.37373, -3.193895, 1, 1, 1, 1, 1,
-1.218392, -0.4400877, -1.091091, 1, 1, 1, 1, 1,
-1.20847, 1.189887, -2.415602, 1, 1, 1, 1, 1,
-1.205855, 1.176499, -1.380068, 1, 1, 1, 1, 1,
-1.203125, 1.463609, -0.7800345, 1, 1, 1, 1, 1,
-1.196247, -1.050582, -1.346971, 1, 1, 1, 1, 1,
-1.182267, 0.353481, -2.426361, 0, 0, 1, 1, 1,
-1.17849, -0.1689456, -2.212596, 1, 0, 0, 1, 1,
-1.172708, -2.273118, -2.766331, 1, 0, 0, 1, 1,
-1.168902, -0.246012, -1.706677, 1, 0, 0, 1, 1,
-1.163177, -0.7194048, -1.984278, 1, 0, 0, 1, 1,
-1.160863, -0.7969492, -2.596014, 1, 0, 0, 1, 1,
-1.160199, 1.635007, 0.334785, 0, 0, 0, 1, 1,
-1.157084, -0.6400172, -2.602414, 0, 0, 0, 1, 1,
-1.156816, -0.5181612, -0.9879796, 0, 0, 0, 1, 1,
-1.151426, -0.1000832, -0.01644703, 0, 0, 0, 1, 1,
-1.149919, -1.416365, -0.946573, 0, 0, 0, 1, 1,
-1.147632, -0.8105077, -1.292162, 0, 0, 0, 1, 1,
-1.14731, -1.492766, -3.804795, 0, 0, 0, 1, 1,
-1.136828, 0.4836732, 0.5666195, 1, 1, 1, 1, 1,
-1.134226, -0.0359273, -1.076822, 1, 1, 1, 1, 1,
-1.105675, 0.6607456, -0.6506833, 1, 1, 1, 1, 1,
-1.105658, 1.556372, 0.09404317, 1, 1, 1, 1, 1,
-1.105137, 1.498084, -1.412092, 1, 1, 1, 1, 1,
-1.10203, 0.01720717, -1.155416, 1, 1, 1, 1, 1,
-1.101814, 0.5863031, -1.814521, 1, 1, 1, 1, 1,
-1.093268, 0.01635262, -0.8688436, 1, 1, 1, 1, 1,
-1.087089, -1.679348, -2.335623, 1, 1, 1, 1, 1,
-1.083705, -1.311798, -3.468086, 1, 1, 1, 1, 1,
-1.07951, 0.05395411, -1.525783, 1, 1, 1, 1, 1,
-1.058594, -0.6874464, -2.301485, 1, 1, 1, 1, 1,
-1.052714, -2.193384, -3.660222, 1, 1, 1, 1, 1,
-1.048064, 0.4296165, -1.649268, 1, 1, 1, 1, 1,
-1.046369, 0.5961853, -0.8125798, 1, 1, 1, 1, 1,
-1.04583, -0.05861011, -2.732054, 0, 0, 1, 1, 1,
-1.035063, -1.192109, 0.9152454, 1, 0, 0, 1, 1,
-1.031081, 0.3551031, -1.711238, 1, 0, 0, 1, 1,
-1.028726, 0.3257804, -2.980884, 1, 0, 0, 1, 1,
-1.025497, 1.637412, 0.8409633, 1, 0, 0, 1, 1,
-1.022232, 0.6813433, -2.216958, 1, 0, 0, 1, 1,
-1.011799, 2.115511, -0.264394, 0, 0, 0, 1, 1,
-1.004276, -0.3715369, -1.762491, 0, 0, 0, 1, 1,
-1.002818, -0.4480979, -3.38516, 0, 0, 0, 1, 1,
-0.9921692, -1.533643, -2.603815, 0, 0, 0, 1, 1,
-0.9914523, -0.4849318, -3.843871, 0, 0, 0, 1, 1,
-0.9889802, -1.114949, -3.235426, 0, 0, 0, 1, 1,
-0.9868464, -0.2741983, -0.3853349, 0, 0, 0, 1, 1,
-0.9837192, 1.582486, 1.149619, 1, 1, 1, 1, 1,
-0.9798025, -1.379666, -2.395875, 1, 1, 1, 1, 1,
-0.975654, 0.101881, 0.5806313, 1, 1, 1, 1, 1,
-0.9752226, 2.482763, -1.602553, 1, 1, 1, 1, 1,
-0.9731121, -0.6619404, -1.641234, 1, 1, 1, 1, 1,
-0.9647963, 0.7327511, 0.410019, 1, 1, 1, 1, 1,
-0.9518855, 0.3704334, -0.1362454, 1, 1, 1, 1, 1,
-0.9514872, 1.924026, -0.7534552, 1, 1, 1, 1, 1,
-0.9422569, 1.045001, 0.3677797, 1, 1, 1, 1, 1,
-0.9376735, 1.025569, 0.3448575, 1, 1, 1, 1, 1,
-0.9364183, -3.040366, -2.552744, 1, 1, 1, 1, 1,
-0.9340431, -0.2556824, -2.153384, 1, 1, 1, 1, 1,
-0.9329423, -1.853866, -2.781839, 1, 1, 1, 1, 1,
-0.9300882, 0.1162537, -2.681929, 1, 1, 1, 1, 1,
-0.927896, -0.358386, -3.538707, 1, 1, 1, 1, 1,
-0.9275861, 0.7925375, 0.6481183, 0, 0, 1, 1, 1,
-0.9254243, -0.5445485, -0.6554565, 1, 0, 0, 1, 1,
-0.9253209, -0.2432417, -0.475883, 1, 0, 0, 1, 1,
-0.9220075, -1.183902, -2.111966, 1, 0, 0, 1, 1,
-0.9210111, 1.6089, 0.288213, 1, 0, 0, 1, 1,
-0.9200662, -1.698155, -4.404842, 1, 0, 0, 1, 1,
-0.9184638, 0.01842535, -3.362503, 0, 0, 0, 1, 1,
-0.9143995, -0.4303667, -1.72085, 0, 0, 0, 1, 1,
-0.9140123, 0.2825042, -0.8015626, 0, 0, 0, 1, 1,
-0.9121499, 0.1843778, -1.090506, 0, 0, 0, 1, 1,
-0.9064419, -0.8779423, -1.053299, 0, 0, 0, 1, 1,
-0.8965576, 1.613555, 1.739849, 0, 0, 0, 1, 1,
-0.8951215, 0.7144936, -0.8090647, 0, 0, 0, 1, 1,
-0.8816394, 2.272026, -0.6268812, 1, 1, 1, 1, 1,
-0.879567, -0.04819252, -2.12459, 1, 1, 1, 1, 1,
-0.8758392, 0.6332957, -0.3404978, 1, 1, 1, 1, 1,
-0.8750257, 0.5347006, -1.718363, 1, 1, 1, 1, 1,
-0.8749369, 0.09150287, -2.404994, 1, 1, 1, 1, 1,
-0.8701487, 1.163043, -0.8622084, 1, 1, 1, 1, 1,
-0.8605433, -0.2879113, -1.466555, 1, 1, 1, 1, 1,
-0.8583314, 1.354428, -0.832929, 1, 1, 1, 1, 1,
-0.8505243, 0.3685744, -1.228372, 1, 1, 1, 1, 1,
-0.8390604, 0.1860102, -1.266507, 1, 1, 1, 1, 1,
-0.8324059, -0.3548644, -1.296714, 1, 1, 1, 1, 1,
-0.8292205, 0.5823992, 0.7048625, 1, 1, 1, 1, 1,
-0.828594, 0.8255002, -0.3197082, 1, 1, 1, 1, 1,
-0.821781, 0.705723, -0.629236, 1, 1, 1, 1, 1,
-0.8199919, 0.5596344, -2.859051, 1, 1, 1, 1, 1,
-0.8192762, 0.9444928, -0.02646784, 0, 0, 1, 1, 1,
-0.8175336, -1.39777, -1.780895, 1, 0, 0, 1, 1,
-0.8074414, -1.848229, -3.237029, 1, 0, 0, 1, 1,
-0.8055285, 0.3740889, -1.985166, 1, 0, 0, 1, 1,
-0.7948422, 0.5760774, 0.4336318, 1, 0, 0, 1, 1,
-0.7907031, 1.712693, -0.4226728, 1, 0, 0, 1, 1,
-0.786808, 0.06904274, -0.9257723, 0, 0, 0, 1, 1,
-0.7858336, -0.7163365, -1.998883, 0, 0, 0, 1, 1,
-0.7838101, 1.055514, -0.3180403, 0, 0, 0, 1, 1,
-0.7821668, 1.14122, 0.2986532, 0, 0, 0, 1, 1,
-0.7715036, 0.5321712, -1.491371, 0, 0, 0, 1, 1,
-0.7612828, 1.183925, 0.3345267, 0, 0, 0, 1, 1,
-0.7602328, -0.54798, -3.700817, 0, 0, 0, 1, 1,
-0.7528002, 1.041624, -0.9115518, 1, 1, 1, 1, 1,
-0.7515048, -0.4892076, -1.808079, 1, 1, 1, 1, 1,
-0.7491802, 1.448479, 0.2296383, 1, 1, 1, 1, 1,
-0.7470283, 0.3299737, -0.3332219, 1, 1, 1, 1, 1,
-0.7451417, 2.603534, -0.2086858, 1, 1, 1, 1, 1,
-0.7420954, 0.9121215, -1.748968, 1, 1, 1, 1, 1,
-0.7420481, -0.2193287, -2.086771, 1, 1, 1, 1, 1,
-0.7387633, -1.605608, -1.764958, 1, 1, 1, 1, 1,
-0.737259, 1.143101, -1.783625, 1, 1, 1, 1, 1,
-0.7320305, -0.7791268, -1.723267, 1, 1, 1, 1, 1,
-0.7283273, 0.7197178, 2.238832, 1, 1, 1, 1, 1,
-0.7240638, -0.7891886, -1.32749, 1, 1, 1, 1, 1,
-0.7226228, 0.628598, 0.5428966, 1, 1, 1, 1, 1,
-0.7203186, -0.1311894, -0.6055363, 1, 1, 1, 1, 1,
-0.7118976, 0.6026836, -1.877525, 1, 1, 1, 1, 1,
-0.709027, -0.3352404, -0.3215753, 0, 0, 1, 1, 1,
-0.7078833, -1.048987, -3.111331, 1, 0, 0, 1, 1,
-0.7011492, -1.435255, -2.19264, 1, 0, 0, 1, 1,
-0.6953157, -0.319867, -2.262564, 1, 0, 0, 1, 1,
-0.6902239, -0.4020992, -2.295897, 1, 0, 0, 1, 1,
-0.687705, 0.05454047, -2.607371, 1, 0, 0, 1, 1,
-0.685259, 0.8572811, 1.086223, 0, 0, 0, 1, 1,
-0.6801295, -2.397126, -2.80055, 0, 0, 0, 1, 1,
-0.6747043, 1.229858, 0.1919557, 0, 0, 0, 1, 1,
-0.6745965, 1.339174, -0.9565636, 0, 0, 0, 1, 1,
-0.6697946, 0.941509, -0.211776, 0, 0, 0, 1, 1,
-0.6649126, -0.5742755, -0.5890587, 0, 0, 0, 1, 1,
-0.6625246, -1.464828, -1.441425, 0, 0, 0, 1, 1,
-0.6623565, 0.4434561, 0.7528719, 1, 1, 1, 1, 1,
-0.6616234, -0.2020585, -1.977581, 1, 1, 1, 1, 1,
-0.6606234, -0.3660163, -3.514912, 1, 1, 1, 1, 1,
-0.6535016, 1.013434, -0.5504839, 1, 1, 1, 1, 1,
-0.6533318, 0.3534984, -1.934002, 1, 1, 1, 1, 1,
-0.6522318, 1.704371, -0.6487173, 1, 1, 1, 1, 1,
-0.6522262, 0.864118, -0.6798738, 1, 1, 1, 1, 1,
-0.6501009, -0.5773923, -0.7767949, 1, 1, 1, 1, 1,
-0.6492375, 1.28623, -0.3144679, 1, 1, 1, 1, 1,
-0.6487424, -1.476162, -1.888982, 1, 1, 1, 1, 1,
-0.6474717, -0.2290011, -1.568088, 1, 1, 1, 1, 1,
-0.6354419, 1.447505, 0.940712, 1, 1, 1, 1, 1,
-0.6335263, -1.080852, -1.996166, 1, 1, 1, 1, 1,
-0.6257592, -0.8276204, -2.48871, 1, 1, 1, 1, 1,
-0.6254507, -0.9140169, -2.338827, 1, 1, 1, 1, 1,
-0.6249812, -0.02032418, -3.04718, 0, 0, 1, 1, 1,
-0.6218978, -0.8309429, -4.627135, 1, 0, 0, 1, 1,
-0.6182799, -0.804933, -1.858394, 1, 0, 0, 1, 1,
-0.6176174, 1.626299, -1.121037, 1, 0, 0, 1, 1,
-0.6151205, -0.2746928, -2.641075, 1, 0, 0, 1, 1,
-0.6113268, 1.106695, -0.5257123, 1, 0, 0, 1, 1,
-0.6094149, -1.795917, -4.223386, 0, 0, 0, 1, 1,
-0.6090353, 2.057852, 1.235563, 0, 0, 0, 1, 1,
-0.6067603, 1.468956, 0.2990201, 0, 0, 0, 1, 1,
-0.6010948, 0.4308276, -0.3758259, 0, 0, 0, 1, 1,
-0.5939302, -0.7892944, -2.880802, 0, 0, 0, 1, 1,
-0.5892341, -0.08125924, 0.5411189, 0, 0, 0, 1, 1,
-0.5887437, 0.5460244, -1.190873, 0, 0, 0, 1, 1,
-0.5885537, 1.497154, -1.222924, 1, 1, 1, 1, 1,
-0.5867276, 0.02352985, -2.68758, 1, 1, 1, 1, 1,
-0.5844489, 0.4140109, -1.11788, 1, 1, 1, 1, 1,
-0.5746629, 0.5832843, -1.674145, 1, 1, 1, 1, 1,
-0.5721524, -0.03813987, -2.227763, 1, 1, 1, 1, 1,
-0.5666798, -0.8133146, -3.029686, 1, 1, 1, 1, 1,
-0.5653825, -0.6683489, -2.801655, 1, 1, 1, 1, 1,
-0.5637895, 0.5115092, -2.026166, 1, 1, 1, 1, 1,
-0.5619923, 0.354861, -0.5438001, 1, 1, 1, 1, 1,
-0.5612542, -0.2836347, -1.884517, 1, 1, 1, 1, 1,
-0.5589361, 1.014828, -2.094033, 1, 1, 1, 1, 1,
-0.5519288, 1.89038, -0.7882987, 1, 1, 1, 1, 1,
-0.5500368, -0.07254697, -1.652062, 1, 1, 1, 1, 1,
-0.5484965, -0.9444924, -3.196248, 1, 1, 1, 1, 1,
-0.5420781, 1.009322, -0.887753, 1, 1, 1, 1, 1,
-0.5414324, 0.05518097, -2.354818, 0, 0, 1, 1, 1,
-0.5400084, -0.3154067, -3.133422, 1, 0, 0, 1, 1,
-0.5344425, -0.9678949, -1.551271, 1, 0, 0, 1, 1,
-0.5334265, 1.15967, -1.274342, 1, 0, 0, 1, 1,
-0.5312344, -0.6806839, -2.644094, 1, 0, 0, 1, 1,
-0.5299202, -1.522483, -1.845137, 1, 0, 0, 1, 1,
-0.5287875, -0.06369599, -1.466787, 0, 0, 0, 1, 1,
-0.5283153, 0.9231498, 0.3330657, 0, 0, 0, 1, 1,
-0.5251633, -0.3038757, -1.294208, 0, 0, 0, 1, 1,
-0.5239325, -0.611793, -1.969616, 0, 0, 0, 1, 1,
-0.5180677, 1.443841, 0.1655753, 0, 0, 0, 1, 1,
-0.5145007, -1.085169, -2.416492, 0, 0, 0, 1, 1,
-0.5137983, 1.808104, -1.298719, 0, 0, 0, 1, 1,
-0.5074292, -0.2845432, -5.344861, 1, 1, 1, 1, 1,
-0.50459, -0.1633964, -1.649195, 1, 1, 1, 1, 1,
-0.5045053, -0.4708607, -2.23981, 1, 1, 1, 1, 1,
-0.5015091, 1.65275, 1.322217, 1, 1, 1, 1, 1,
-0.5009398, -0.4565666, -2.107145, 1, 1, 1, 1, 1,
-0.5008069, -1.925924, -3.056457, 1, 1, 1, 1, 1,
-0.4963656, -0.7159619, -1.994714, 1, 1, 1, 1, 1,
-0.4908601, 0.2705762, -0.07581007, 1, 1, 1, 1, 1,
-0.4891831, 0.1808772, -1.682922, 1, 1, 1, 1, 1,
-0.4864683, -0.02461228, -1.778117, 1, 1, 1, 1, 1,
-0.4784881, -2.302258, -2.453696, 1, 1, 1, 1, 1,
-0.4782663, -0.4822463, -2.828569, 1, 1, 1, 1, 1,
-0.477158, -0.291068, -1.160723, 1, 1, 1, 1, 1,
-0.4709322, -0.9334047, -2.453321, 1, 1, 1, 1, 1,
-0.468303, -0.31601, -2.359156, 1, 1, 1, 1, 1,
-0.4678598, -0.7952012, -3.15498, 0, 0, 1, 1, 1,
-0.4677838, -0.4106516, -3.469761, 1, 0, 0, 1, 1,
-0.464466, 1.154914, -1.136097, 1, 0, 0, 1, 1,
-0.4635584, -0.9346876, -2.978583, 1, 0, 0, 1, 1,
-0.4628536, -0.2735593, -2.291215, 1, 0, 0, 1, 1,
-0.4619442, 0.224653, -1.123793, 1, 0, 0, 1, 1,
-0.4507225, -0.8932801, -0.8716211, 0, 0, 0, 1, 1,
-0.4507175, -0.2268195, -1.784326, 0, 0, 0, 1, 1,
-0.4471118, -0.9730201, -1.984113, 0, 0, 0, 1, 1,
-0.4423624, -0.5080415, -3.089422, 0, 0, 0, 1, 1,
-0.4415787, -0.4786823, -0.9843341, 0, 0, 0, 1, 1,
-0.4375738, -1.000119, -2.137625, 0, 0, 0, 1, 1,
-0.4375131, 1.454618, -0.8129318, 0, 0, 0, 1, 1,
-0.4318028, 1.094079, -1.136072, 1, 1, 1, 1, 1,
-0.4302564, -0.1251107, -1.008684, 1, 1, 1, 1, 1,
-0.425509, 0.9533377, 0.2474444, 1, 1, 1, 1, 1,
-0.4216653, -1.237062, -1.304285, 1, 1, 1, 1, 1,
-0.4197094, 1.617661, 0.5060038, 1, 1, 1, 1, 1,
-0.4183401, -0.4980351, -3.592974, 1, 1, 1, 1, 1,
-0.4180664, -0.8391539, -4.025467, 1, 1, 1, 1, 1,
-0.4076119, 1.353431, 0.951238, 1, 1, 1, 1, 1,
-0.4074276, 0.978692, 0.0688156, 1, 1, 1, 1, 1,
-0.4063254, -0.06036938, -3.128946, 1, 1, 1, 1, 1,
-0.4046949, 0.005491003, -2.785392, 1, 1, 1, 1, 1,
-0.4042033, 0.617834, -0.8740051, 1, 1, 1, 1, 1,
-0.4037284, -0.8023161, -3.072173, 1, 1, 1, 1, 1,
-0.3989752, -0.679451, -4.114427, 1, 1, 1, 1, 1,
-0.3947739, -0.4814858, -2.289043, 1, 1, 1, 1, 1,
-0.3923685, 0.9852048, 0.8999709, 0, 0, 1, 1, 1,
-0.3898939, 0.146367, -0.3160471, 1, 0, 0, 1, 1,
-0.3834404, 0.576121, 0.4261544, 1, 0, 0, 1, 1,
-0.3827805, 0.2168234, -1.248207, 1, 0, 0, 1, 1,
-0.3826072, -0.5088543, -2.104749, 1, 0, 0, 1, 1,
-0.3757153, -0.5929284, -2.460691, 1, 0, 0, 1, 1,
-0.3731836, 1.091891, -0.3250986, 0, 0, 0, 1, 1,
-0.3687015, -0.04400549, -3.054957, 0, 0, 0, 1, 1,
-0.3669559, 0.09661325, -1.329088, 0, 0, 0, 1, 1,
-0.3627247, -0.04127933, -0.4092412, 0, 0, 0, 1, 1,
-0.3617333, -0.5298238, -2.106924, 0, 0, 0, 1, 1,
-0.3608194, 1.899817, 0.1133821, 0, 0, 0, 1, 1,
-0.3597183, 1.238218, -0.3512137, 0, 0, 0, 1, 1,
-0.3587606, 0.0531227, -0.561008, 1, 1, 1, 1, 1,
-0.3573546, 0.9087316, -0.4660882, 1, 1, 1, 1, 1,
-0.3494736, -0.3732388, -1.121317, 1, 1, 1, 1, 1,
-0.3492126, 1.151905, -0.1928351, 1, 1, 1, 1, 1,
-0.3458729, -0.03972447, -1.651771, 1, 1, 1, 1, 1,
-0.3389909, 1.903745, 1.387775, 1, 1, 1, 1, 1,
-0.3383424, 0.5957386, -2.753801, 1, 1, 1, 1, 1,
-0.3329585, -1.357027, -2.730037, 1, 1, 1, 1, 1,
-0.3279572, 2.322831, -0.4683646, 1, 1, 1, 1, 1,
-0.3271499, 0.8292802, -1.349777, 1, 1, 1, 1, 1,
-0.3268842, -1.329595, -2.546439, 1, 1, 1, 1, 1,
-0.3263275, -1.026468, -3.370715, 1, 1, 1, 1, 1,
-0.3242975, -0.8383464, -3.715874, 1, 1, 1, 1, 1,
-0.3237303, -0.0217249, -1.853907, 1, 1, 1, 1, 1,
-0.3236727, 0.6129954, -1.431233, 1, 1, 1, 1, 1,
-0.3178025, 1.770846, -2.139062, 0, 0, 1, 1, 1,
-0.3149663, -0.6434436, -3.593214, 1, 0, 0, 1, 1,
-0.3107995, 1.454354, -1.59558, 1, 0, 0, 1, 1,
-0.3083721, 0.3299969, -0.5720091, 1, 0, 0, 1, 1,
-0.3072609, -0.2670201, -1.777006, 1, 0, 0, 1, 1,
-0.3071328, 1.49229, -0.3974279, 1, 0, 0, 1, 1,
-0.3070804, -1.351642, -2.216557, 0, 0, 0, 1, 1,
-0.3032986, -0.2793161, 0.3170054, 0, 0, 0, 1, 1,
-0.3013334, -0.2811722, -1.650677, 0, 0, 0, 1, 1,
-0.2857661, 0.1883943, -1.151251, 0, 0, 0, 1, 1,
-0.2822212, -0.6699315, -0.5321953, 0, 0, 0, 1, 1,
-0.2814738, -0.4652632, -3.044355, 0, 0, 0, 1, 1,
-0.2813026, -0.6926153, -3.343435, 0, 0, 0, 1, 1,
-0.279351, -2.920642, -2.24081, 1, 1, 1, 1, 1,
-0.2783978, -1.074341, -2.009576, 1, 1, 1, 1, 1,
-0.2729992, -0.3442924, -3.220777, 1, 1, 1, 1, 1,
-0.2709878, -1.815323, -3.729537, 1, 1, 1, 1, 1,
-0.2701462, 1.120874, -0.3418335, 1, 1, 1, 1, 1,
-0.2700587, -0.403688, -4.379607, 1, 1, 1, 1, 1,
-0.2693019, 0.0001274757, -0.4257562, 1, 1, 1, 1, 1,
-0.2605222, 2.153815, 0.5934558, 1, 1, 1, 1, 1,
-0.2538035, -0.1407385, -2.447603, 1, 1, 1, 1, 1,
-0.2532775, 0.7547199, -1.882482, 1, 1, 1, 1, 1,
-0.2530613, 0.7894892, 1.011195, 1, 1, 1, 1, 1,
-0.2419451, 0.9356294, -1.693889, 1, 1, 1, 1, 1,
-0.2360847, -1.031855, -3.01511, 1, 1, 1, 1, 1,
-0.2356463, -0.1349912, -2.484235, 1, 1, 1, 1, 1,
-0.2335331, 0.4069667, -0.8017837, 1, 1, 1, 1, 1,
-0.2327363, 0.3072237, -0.9978161, 0, 0, 1, 1, 1,
-0.2305173, 0.1925139, -0.4248442, 1, 0, 0, 1, 1,
-0.2287124, 0.3661828, 1.585083, 1, 0, 0, 1, 1,
-0.2280674, -0.1002392, -1.472974, 1, 0, 0, 1, 1,
-0.2267452, 0.467475, 0.1535462, 1, 0, 0, 1, 1,
-0.2245374, 0.2825696, -0.7433016, 1, 0, 0, 1, 1,
-0.2229441, 1.388952, 1.260356, 0, 0, 0, 1, 1,
-0.2224082, -0.3443024, -2.5674, 0, 0, 0, 1, 1,
-0.2170359, -0.4117327, -0.9168224, 0, 0, 0, 1, 1,
-0.2166891, -0.4716406, -3.191235, 0, 0, 0, 1, 1,
-0.2124365, 0.5986735, -0.4682188, 0, 0, 0, 1, 1,
-0.2112316, 0.5599695, 0.8413918, 0, 0, 0, 1, 1,
-0.2099508, 0.7643728, -0.7744067, 0, 0, 0, 1, 1,
-0.2064363, 0.1129028, -1.131295, 1, 1, 1, 1, 1,
-0.2027581, -0.8361203, -2.579748, 1, 1, 1, 1, 1,
-0.2006537, -0.3012726, -3.999654, 1, 1, 1, 1, 1,
-0.200042, 1.18267, 0.2226679, 1, 1, 1, 1, 1,
-0.1997686, -1.364097, -4.434381, 1, 1, 1, 1, 1,
-0.1989048, 0.1599589, 0.7398136, 1, 1, 1, 1, 1,
-0.1979865, 0.3967737, -1.848683, 1, 1, 1, 1, 1,
-0.1964788, 1.145926, -0.4950092, 1, 1, 1, 1, 1,
-0.1950518, -0.1688429, -5.124945, 1, 1, 1, 1, 1,
-0.1874365, 0.4158206, -0.03279247, 1, 1, 1, 1, 1,
-0.1870159, -1.972305, -3.102315, 1, 1, 1, 1, 1,
-0.1866223, 1.223604, -1.169959, 1, 1, 1, 1, 1,
-0.1850371, -1.027774, -3.35349, 1, 1, 1, 1, 1,
-0.181813, 0.2049304, -2.072652, 1, 1, 1, 1, 1,
-0.1776629, 0.0759963, -1.422041, 1, 1, 1, 1, 1,
-0.1769667, 0.832171, 1.814132, 0, 0, 1, 1, 1,
-0.1756593, 1.126169, -1.372591, 1, 0, 0, 1, 1,
-0.1737704, 0.8059639, -1.411571, 1, 0, 0, 1, 1,
-0.1733554, 0.6195257, -1.076903, 1, 0, 0, 1, 1,
-0.1725423, 0.4506228, -0.1047005, 1, 0, 0, 1, 1,
-0.1685353, -1.235234, -4.550611, 1, 0, 0, 1, 1,
-0.1669054, 0.07120153, 1.569677, 0, 0, 0, 1, 1,
-0.1663178, -1.696371, -2.684426, 0, 0, 0, 1, 1,
-0.1627196, 2.215641, 0.7545312, 0, 0, 0, 1, 1,
-0.1587124, -0.09675735, -2.716908, 0, 0, 0, 1, 1,
-0.1584118, -0.7451446, -2.687057, 0, 0, 0, 1, 1,
-0.1561325, -0.6162295, -4.041188, 0, 0, 0, 1, 1,
-0.1558106, -0.9090449, -3.833534, 0, 0, 0, 1, 1,
-0.1545713, 1.217001, -1.126375, 1, 1, 1, 1, 1,
-0.1541361, -2.193711, -2.923683, 1, 1, 1, 1, 1,
-0.1537516, -0.2415034, -1.63064, 1, 1, 1, 1, 1,
-0.1524155, -0.2510036, -3.086802, 1, 1, 1, 1, 1,
-0.1516861, 2.867417, -0.8030658, 1, 1, 1, 1, 1,
-0.150198, -0.0799709, -1.761961, 1, 1, 1, 1, 1,
-0.147468, 0.2445894, -0.7851909, 1, 1, 1, 1, 1,
-0.1465324, -0.1023179, -1.96185, 1, 1, 1, 1, 1,
-0.1461307, -0.409067, -4.378784, 1, 1, 1, 1, 1,
-0.1447468, 2.108299, -0.4165218, 1, 1, 1, 1, 1,
-0.1443014, 0.1540891, -2.313449, 1, 1, 1, 1, 1,
-0.1438091, 0.8195276, 0.8302165, 1, 1, 1, 1, 1,
-0.1400171, -0.1347569, -1.816435, 1, 1, 1, 1, 1,
-0.1383092, 0.2299775, -2.6746, 1, 1, 1, 1, 1,
-0.1369099, -0.4206095, -2.77887, 1, 1, 1, 1, 1,
-0.1352563, 0.6428529, 1.52826, 0, 0, 1, 1, 1,
-0.133862, -1.618834, -2.811088, 1, 0, 0, 1, 1,
-0.1337873, -1.567081, -2.165174, 1, 0, 0, 1, 1,
-0.1330124, 1.790045, 1.204405, 1, 0, 0, 1, 1,
-0.130887, -1.536089, -3.538287, 1, 0, 0, 1, 1,
-0.130374, 1.018583, -2.15341, 1, 0, 0, 1, 1,
-0.1301508, 0.6409885, -0.3342281, 0, 0, 0, 1, 1,
-0.1244373, -0.5135086, -4.087082, 0, 0, 0, 1, 1,
-0.1244308, 0.5994835, -0.6966029, 0, 0, 0, 1, 1,
-0.1243299, -1.248989, -4.279397, 0, 0, 0, 1, 1,
-0.1205133, 0.9640898, -0.01865208, 0, 0, 0, 1, 1,
-0.1204616, -1.974177, -3.153986, 0, 0, 0, 1, 1,
-0.1179763, -0.1107038, -2.118007, 0, 0, 0, 1, 1,
-0.1179565, 0.3369396, -1.868829, 1, 1, 1, 1, 1,
-0.1155788, -1.586055, -1.626986, 1, 1, 1, 1, 1,
-0.1145633, -0.9295056, -2.743533, 1, 1, 1, 1, 1,
-0.1086703, -0.9422764, -2.342981, 1, 1, 1, 1, 1,
-0.1051313, -1.283756, -3.015307, 1, 1, 1, 1, 1,
-0.1044756, -0.8012723, -3.234098, 1, 1, 1, 1, 1,
-0.1028094, 1.429192, 0.2642078, 1, 1, 1, 1, 1,
-0.09882471, 0.9898915, -1.35512, 1, 1, 1, 1, 1,
-0.09762126, 0.07497369, -0.5435277, 1, 1, 1, 1, 1,
-0.09759523, 1.10763, 0.08718198, 1, 1, 1, 1, 1,
-0.09375043, -1.252117, -2.228777, 1, 1, 1, 1, 1,
-0.08763118, 1.009668, -1.559688, 1, 1, 1, 1, 1,
-0.08635873, -1.92129, -3.866694, 1, 1, 1, 1, 1,
-0.08512899, 0.3359904, 1.163333, 1, 1, 1, 1, 1,
-0.08153056, 0.1516927, -0.3610244, 1, 1, 1, 1, 1,
-0.08124639, 0.1135485, -1.758064, 0, 0, 1, 1, 1,
-0.07739589, 0.9453601, 1.022727, 1, 0, 0, 1, 1,
-0.07398806, -2.105894, -2.878289, 1, 0, 0, 1, 1,
-0.07344421, -2.042935, -2.755469, 1, 0, 0, 1, 1,
-0.07062756, -0.2215849, -3.25789, 1, 0, 0, 1, 1,
-0.0696717, 0.8699067, 2.136763, 1, 0, 0, 1, 1,
-0.06260505, -0.8706199, -3.330332, 0, 0, 0, 1, 1,
-0.05739075, -0.3505232, -3.021985, 0, 0, 0, 1, 1,
-0.04999968, -1.116788, -1.894271, 0, 0, 0, 1, 1,
-0.0496377, 1.385301, -0.01832178, 0, 0, 0, 1, 1,
-0.04136879, -0.1098692, -2.732342, 0, 0, 0, 1, 1,
-0.04121744, -1.037387, 0.2314437, 0, 0, 0, 1, 1,
-0.03966056, 1.062557, -0.3601213, 0, 0, 0, 1, 1,
-0.03928313, 0.7329893, -0.1958353, 1, 1, 1, 1, 1,
-0.03744591, -2.592327, -1.602754, 1, 1, 1, 1, 1,
-0.0364935, 1.235591, -1.18033, 1, 1, 1, 1, 1,
-0.03434192, -0.1473549, -3.021369, 1, 1, 1, 1, 1,
-0.03406613, -0.3444578, -1.234347, 1, 1, 1, 1, 1,
-0.03336857, -1.058689, -4.744028, 1, 1, 1, 1, 1,
-0.03097307, -0.01630353, -1.691138, 1, 1, 1, 1, 1,
-0.0268211, -0.1602679, -2.699317, 1, 1, 1, 1, 1,
-0.02588165, 0.8974161, -0.3114119, 1, 1, 1, 1, 1,
-0.02400088, -0.8645257, -1.560013, 1, 1, 1, 1, 1,
-0.0219118, -1.381993, -2.488313, 1, 1, 1, 1, 1,
-0.02051995, -1.829726, -3.31254, 1, 1, 1, 1, 1,
-0.01752984, 0.2686288, 0.01233734, 1, 1, 1, 1, 1,
-0.01527781, -1.162863, -3.382127, 1, 1, 1, 1, 1,
-0.01243407, -0.5234993, -2.114803, 1, 1, 1, 1, 1,
-0.01039409, 0.3976951, -0.6200324, 0, 0, 1, 1, 1,
-0.009190043, -0.4202474, -3.969315, 1, 0, 0, 1, 1,
-0.004402964, 1.07441, -0.8536571, 1, 0, 0, 1, 1,
-0.003095336, 0.04340433, -0.4800389, 1, 0, 0, 1, 1,
-0.003067226, 0.281949, 0.3669193, 1, 0, 0, 1, 1,
-0.002505053, -0.05820879, -2.182147, 1, 0, 0, 1, 1,
0.0003692725, 1.552757, -0.2357883, 0, 0, 0, 1, 1,
0.004656676, -0.4043964, 2.541025, 0, 0, 0, 1, 1,
0.005770351, 0.7554903, 0.3446353, 0, 0, 0, 1, 1,
0.006704032, -1.162977, 2.820636, 0, 0, 0, 1, 1,
0.006814268, 1.06524, 1.136068, 0, 0, 0, 1, 1,
0.008472222, -1.303697, 2.59775, 0, 0, 0, 1, 1,
0.009034166, 0.1911294, 0.1354059, 0, 0, 0, 1, 1,
0.01596541, -0.9848673, 4.417768, 1, 1, 1, 1, 1,
0.01620086, 2.189273, 0.6026394, 1, 1, 1, 1, 1,
0.02076369, -0.1106431, 3.555938, 1, 1, 1, 1, 1,
0.02542477, -0.7153866, 2.683841, 1, 1, 1, 1, 1,
0.02643704, 1.045894, -0.04132812, 1, 1, 1, 1, 1,
0.02893034, 0.27919, 1.353217, 1, 1, 1, 1, 1,
0.02995059, 1.147241, 0.5660385, 1, 1, 1, 1, 1,
0.03605783, 0.3079181, -1.327741, 1, 1, 1, 1, 1,
0.03938707, 1.745237, 1.194773, 1, 1, 1, 1, 1,
0.04031192, 1.280001, -0.7916501, 1, 1, 1, 1, 1,
0.04461759, -0.3982846, 2.804995, 1, 1, 1, 1, 1,
0.04489526, -0.01247726, 3.834581, 1, 1, 1, 1, 1,
0.04895256, 0.7422456, 2.130143, 1, 1, 1, 1, 1,
0.05048774, 0.1729722, 0.2707779, 1, 1, 1, 1, 1,
0.05292197, 0.08838928, -0.1979801, 1, 1, 1, 1, 1,
0.05674674, -0.4894454, 3.102672, 0, 0, 1, 1, 1,
0.05758449, -0.9286813, 3.026026, 1, 0, 0, 1, 1,
0.06042325, 2.195685, -0.1290342, 1, 0, 0, 1, 1,
0.06078317, -0.442264, 3.466865, 1, 0, 0, 1, 1,
0.06198701, -1.031982, 2.309114, 1, 0, 0, 1, 1,
0.06259873, -0.9035705, 3.61161, 1, 0, 0, 1, 1,
0.06427499, -1.446608, 0.6585086, 0, 0, 0, 1, 1,
0.0715244, 0.5367221, -1.354929, 0, 0, 0, 1, 1,
0.07312077, 0.1344486, 0.1249425, 0, 0, 0, 1, 1,
0.07667528, -0.4306802, 3.249232, 0, 0, 0, 1, 1,
0.07872912, -0.001374046, 1.213369, 0, 0, 0, 1, 1,
0.08520085, 0.3796177, -0.7027311, 0, 0, 0, 1, 1,
0.08627947, 0.4665848, -1.127702, 0, 0, 0, 1, 1,
0.08734666, -0.8898107, 1.867616, 1, 1, 1, 1, 1,
0.08903343, 1.939499, 0.01342894, 1, 1, 1, 1, 1,
0.08951776, -0.02070959, 1.419413, 1, 1, 1, 1, 1,
0.09021429, 0.3798984, 0.8579878, 1, 1, 1, 1, 1,
0.09253243, 0.6675466, 0.780077, 1, 1, 1, 1, 1,
0.09268286, 0.3737747, 0.7059711, 1, 1, 1, 1, 1,
0.0951363, 0.152022, 1.551881, 1, 1, 1, 1, 1,
0.0956203, 0.3047545, 0.7770908, 1, 1, 1, 1, 1,
0.09654453, 1.638523, -0.7588261, 1, 1, 1, 1, 1,
0.09823906, 2.190948, 1.037302, 1, 1, 1, 1, 1,
0.0997992, -0.5983176, 3.230577, 1, 1, 1, 1, 1,
0.1002764, -0.4416048, 3.175672, 1, 1, 1, 1, 1,
0.100584, 1.259452, 0.0611559, 1, 1, 1, 1, 1,
0.1009442, 0.9180443, -0.7286374, 1, 1, 1, 1, 1,
0.1009952, -0.2910778, 0.8863801, 1, 1, 1, 1, 1,
0.1132291, -0.3442537, 3.342655, 0, 0, 1, 1, 1,
0.114411, 1.791549, 0.1625501, 1, 0, 0, 1, 1,
0.1147696, -1.044097, 2.465701, 1, 0, 0, 1, 1,
0.1171608, -0.004447135, 0.009254572, 1, 0, 0, 1, 1,
0.1173102, -0.09868721, 2.17094, 1, 0, 0, 1, 1,
0.1175134, 0.4419196, 2.054112, 1, 0, 0, 1, 1,
0.1249281, 0.03746054, 1.100152, 0, 0, 0, 1, 1,
0.1249951, -1.030921, 0.7199975, 0, 0, 0, 1, 1,
0.1297727, -2.100093, 3.376523, 0, 0, 0, 1, 1,
0.1391548, -0.8495633, 3.264449, 0, 0, 0, 1, 1,
0.1398845, -0.3396634, 2.710478, 0, 0, 0, 1, 1,
0.1416598, 0.1183956, 1.334875, 0, 0, 0, 1, 1,
0.1419469, 0.04920252, 0.01425373, 0, 0, 0, 1, 1,
0.1423046, 1.735656, 1.443944, 1, 1, 1, 1, 1,
0.1461725, 2.669275, 0.6467869, 1, 1, 1, 1, 1,
0.146822, 1.570585, -1.358237, 1, 1, 1, 1, 1,
0.1493678, -1.278816, 3.401492, 1, 1, 1, 1, 1,
0.1533652, 0.1485235, 2.907919, 1, 1, 1, 1, 1,
0.1549531, 0.7537408, 0.3072911, 1, 1, 1, 1, 1,
0.1578412, -0.6646448, 2.960201, 1, 1, 1, 1, 1,
0.1707756, -1.787254, 4.32691, 1, 1, 1, 1, 1,
0.1718714, -0.04350092, 1.634061, 1, 1, 1, 1, 1,
0.172228, 0.4150557, -0.4792026, 1, 1, 1, 1, 1,
0.1724787, 0.8575389, 1.06655, 1, 1, 1, 1, 1,
0.1737494, -1.551754, 0.5708644, 1, 1, 1, 1, 1,
0.1744269, -0.8170979, 2.854522, 1, 1, 1, 1, 1,
0.1783815, 1.995072, -1.828998, 1, 1, 1, 1, 1,
0.1795503, 0.4840196, 0.2027438, 1, 1, 1, 1, 1,
0.1849785, 0.3799943, 0.5341887, 0, 0, 1, 1, 1,
0.1857772, -1.197115, 4.042236, 1, 0, 0, 1, 1,
0.1867901, -1.849074, 2.789628, 1, 0, 0, 1, 1,
0.1890896, -0.292121, 1.824926, 1, 0, 0, 1, 1,
0.1891606, 0.1333998, 1.307561, 1, 0, 0, 1, 1,
0.189227, 0.06015382, 2.158407, 1, 0, 0, 1, 1,
0.1898073, 0.4484577, 1.692056, 0, 0, 0, 1, 1,
0.1926435, 2.041679, -1.674781, 0, 0, 0, 1, 1,
0.1933283, 0.182098, 0.6566211, 0, 0, 0, 1, 1,
0.1941301, -1.375076, 2.947001, 0, 0, 0, 1, 1,
0.1974788, -0.5491373, 0.2894708, 0, 0, 0, 1, 1,
0.1977322, -0.4284766, 2.651594, 0, 0, 0, 1, 1,
0.2017184, -0.5939175, 3.224693, 0, 0, 0, 1, 1,
0.21577, -1.935827, 3.177583, 1, 1, 1, 1, 1,
0.2163846, 0.08802921, 1.467709, 1, 1, 1, 1, 1,
0.2178944, 1.777197, 0.04815912, 1, 1, 1, 1, 1,
0.2188564, -0.8317885, 2.764559, 1, 1, 1, 1, 1,
0.222703, -1.03495, 4.451145, 1, 1, 1, 1, 1,
0.2235186, 0.07283717, 3.487884, 1, 1, 1, 1, 1,
0.2247345, 0.4755619, 1.214706, 1, 1, 1, 1, 1,
0.2263966, 0.5654081, 0.386102, 1, 1, 1, 1, 1,
0.2320018, -0.6463964, 2.736565, 1, 1, 1, 1, 1,
0.2326681, 0.5239792, -1.936009, 1, 1, 1, 1, 1,
0.2348318, -0.4284777, 1.938248, 1, 1, 1, 1, 1,
0.2356404, 1.000157, -0.3321098, 1, 1, 1, 1, 1,
0.2365651, 0.4758866, -0.4543424, 1, 1, 1, 1, 1,
0.2397549, 0.05946676, 0.3111582, 1, 1, 1, 1, 1,
0.2431215, 1.675842, 0.2125816, 1, 1, 1, 1, 1,
0.2468783, -0.05438729, 0.504925, 0, 0, 1, 1, 1,
0.247289, 2.090895, -1.008627, 1, 0, 0, 1, 1,
0.2488431, -1.609697, 4.196075, 1, 0, 0, 1, 1,
0.2534392, -0.02797574, 0.7070578, 1, 0, 0, 1, 1,
0.2544374, 0.6051596, 2.131018, 1, 0, 0, 1, 1,
0.2608801, 0.5212832, 1.039976, 1, 0, 0, 1, 1,
0.2665134, -0.7300103, 3.002653, 0, 0, 0, 1, 1,
0.2666428, 1.306883, 0.4039118, 0, 0, 0, 1, 1,
0.2693879, -0.1605853, 1.883138, 0, 0, 0, 1, 1,
0.2695926, 0.654567, -0.6252436, 0, 0, 0, 1, 1,
0.2713956, 0.2490643, -0.4226867, 0, 0, 0, 1, 1,
0.2744384, -1.38895, 2.852241, 0, 0, 0, 1, 1,
0.2744573, 0.1729548, -0.3867174, 0, 0, 0, 1, 1,
0.2750379, -0.03135666, -0.4667317, 1, 1, 1, 1, 1,
0.2856681, -0.8748385, 2.551858, 1, 1, 1, 1, 1,
0.2878874, -0.160167, 0.6081565, 1, 1, 1, 1, 1,
0.2904522, 0.6580548, -0.4120206, 1, 1, 1, 1, 1,
0.2924233, -0.5285972, 2.451813, 1, 1, 1, 1, 1,
0.3049592, 0.320951, 0.9248487, 1, 1, 1, 1, 1,
0.3067805, 0.3437358, -0.01364008, 1, 1, 1, 1, 1,
0.3076103, 0.2496713, 1.675667, 1, 1, 1, 1, 1,
0.3099512, -1.739008, 2.301252, 1, 1, 1, 1, 1,
0.320293, 1.29009, 0.317308, 1, 1, 1, 1, 1,
0.3204587, -0.2076871, 3.759981, 1, 1, 1, 1, 1,
0.3241248, 0.9999766, 1.140691, 1, 1, 1, 1, 1,
0.3242673, 0.8577062, 0.4475545, 1, 1, 1, 1, 1,
0.325071, 0.8186949, 0.8104259, 1, 1, 1, 1, 1,
0.3252388, 1.010238, 1.322819, 1, 1, 1, 1, 1,
0.3258775, -1.235952, 2.899061, 0, 0, 1, 1, 1,
0.3311585, -0.6810172, 2.90072, 1, 0, 0, 1, 1,
0.3338028, 1.918006, -0.7969703, 1, 0, 0, 1, 1,
0.3341807, -0.05280834, 3.130369, 1, 0, 0, 1, 1,
0.336475, -0.1435288, 2.884088, 1, 0, 0, 1, 1,
0.33691, 0.990851, 0.4398081, 1, 0, 0, 1, 1,
0.3374154, 2.260699, 1.95332, 0, 0, 0, 1, 1,
0.3381462, -1.640613, 1.489992, 0, 0, 0, 1, 1,
0.3386512, 1.119221, 0.3559865, 0, 0, 0, 1, 1,
0.3392753, -0.7694557, 2.093624, 0, 0, 0, 1, 1,
0.3408036, 1.869304, -0.5433775, 0, 0, 0, 1, 1,
0.3418051, 1.357478, -0.3555124, 0, 0, 0, 1, 1,
0.3474796, -0.7561871, 0.9898418, 0, 0, 0, 1, 1,
0.3476084, 1.779835, 0.4356243, 1, 1, 1, 1, 1,
0.3598174, -0.7551823, 3.956079, 1, 1, 1, 1, 1,
0.3613548, -0.7878069, 1.46934, 1, 1, 1, 1, 1,
0.3641985, -0.7764586, 2.12457, 1, 1, 1, 1, 1,
0.3669187, -1.41653, 2.617497, 1, 1, 1, 1, 1,
0.3708778, -1.828694, 4.552022, 1, 1, 1, 1, 1,
0.379169, 1.122388, -0.07868922, 1, 1, 1, 1, 1,
0.3883387, -0.9082323, 2.329396, 1, 1, 1, 1, 1,
0.3906026, 0.5681999, 1.613203, 1, 1, 1, 1, 1,
0.3913625, -0.8823562, 5.237078, 1, 1, 1, 1, 1,
0.3917784, 0.9077698, 0.1465596, 1, 1, 1, 1, 1,
0.3974901, -1.421269, 3.65796, 1, 1, 1, 1, 1,
0.3989957, 1.011376, -0.7277477, 1, 1, 1, 1, 1,
0.400619, -0.3523245, 1.39214, 1, 1, 1, 1, 1,
0.4036596, -0.443558, 2.931039, 1, 1, 1, 1, 1,
0.4058932, -0.03047578, 2.064033, 0, 0, 1, 1, 1,
0.4062184, -0.5860143, 3.519772, 1, 0, 0, 1, 1,
0.4118899, 0.7488443, 0.8689079, 1, 0, 0, 1, 1,
0.413808, -0.1584357, 2.498499, 1, 0, 0, 1, 1,
0.4166729, -1.28508, 3.831703, 1, 0, 0, 1, 1,
0.4200444, -0.04126942, 4.002209, 1, 0, 0, 1, 1,
0.4203362, 0.4881429, 1.641826, 0, 0, 0, 1, 1,
0.4220926, 0.5031614, 0.1773737, 0, 0, 0, 1, 1,
0.4242152, -1.167349, 3.639009, 0, 0, 0, 1, 1,
0.4293509, 0.9042143, 0.7483823, 0, 0, 0, 1, 1,
0.4341429, -2.42608, 1.355862, 0, 0, 0, 1, 1,
0.4345455, -0.2181599, 1.658219, 0, 0, 0, 1, 1,
0.4362087, -0.9924083, 3.93904, 0, 0, 0, 1, 1,
0.4385139, -1.023288, 4.123518, 1, 1, 1, 1, 1,
0.4405147, 0.6137571, 0.9196128, 1, 1, 1, 1, 1,
0.4441755, -1.116104, 1.853571, 1, 1, 1, 1, 1,
0.4449157, -0.1271344, 2.850286, 1, 1, 1, 1, 1,
0.4581951, 2.375474, 0.1166786, 1, 1, 1, 1, 1,
0.4715778, 1.556839, 3.510207, 1, 1, 1, 1, 1,
0.4810349, 0.8347263, 0.5790147, 1, 1, 1, 1, 1,
0.4840384, -0.8830933, 2.873631, 1, 1, 1, 1, 1,
0.484883, 0.4791427, -1.049249, 1, 1, 1, 1, 1,
0.4900409, 0.688006, 0.7502007, 1, 1, 1, 1, 1,
0.4920015, -0.2377167, 1.78381, 1, 1, 1, 1, 1,
0.4943926, -0.07004519, 1.409917, 1, 1, 1, 1, 1,
0.4971129, 1.107186, 0.1470824, 1, 1, 1, 1, 1,
0.4982698, 0.9190128, -0.3349411, 1, 1, 1, 1, 1,
0.4995397, 1.130008, -0.4566375, 1, 1, 1, 1, 1,
0.4998162, 0.252468, 0.5591496, 0, 0, 1, 1, 1,
0.5023383, -1.409866, 2.579396, 1, 0, 0, 1, 1,
0.5095447, 0.272277, 0.1193311, 1, 0, 0, 1, 1,
0.5104338, 0.6315749, -0.2003782, 1, 0, 0, 1, 1,
0.5155678, -1.541881, 1.245069, 1, 0, 0, 1, 1,
0.5197101, 0.3608041, 1.694919, 1, 0, 0, 1, 1,
0.5205193, 0.08272762, 0.9862275, 0, 0, 0, 1, 1,
0.5222519, -0.2564983, 1.152189, 0, 0, 0, 1, 1,
0.5223005, -0.1748486, 2.519573, 0, 0, 0, 1, 1,
0.5268953, -1.225871, 3.297669, 0, 0, 0, 1, 1,
0.5277677, -0.6569588, 0.7659452, 0, 0, 0, 1, 1,
0.5301876, 0.536856, 0.6146162, 0, 0, 0, 1, 1,
0.5313873, -0.430954, 3.244977, 0, 0, 0, 1, 1,
0.5315193, -0.1076973, 0.120337, 1, 1, 1, 1, 1,
0.5411978, 0.9244854, -0.3770592, 1, 1, 1, 1, 1,
0.5414265, -0.3029994, 0.4957989, 1, 1, 1, 1, 1,
0.5422405, 0.04627031, 1.861673, 1, 1, 1, 1, 1,
0.5426347, 3.293183, 1.229601, 1, 1, 1, 1, 1,
0.5439603, -0.2421307, 1.977444, 1, 1, 1, 1, 1,
0.5443755, 0.2618819, 0.778092, 1, 1, 1, 1, 1,
0.5455474, -0.7910817, 3.633014, 1, 1, 1, 1, 1,
0.5460609, 0.9444741, 0.5054743, 1, 1, 1, 1, 1,
0.5480187, 0.803504, -0.6877396, 1, 1, 1, 1, 1,
0.5533375, -0.5586432, 3.356976, 1, 1, 1, 1, 1,
0.5595886, 0.3600085, 1.289668, 1, 1, 1, 1, 1,
0.5598159, -1.254768, 2.81001, 1, 1, 1, 1, 1,
0.5601797, 0.4123896, 0.3392611, 1, 1, 1, 1, 1,
0.5636363, 0.6252607, 1.361441, 1, 1, 1, 1, 1,
0.5684097, 2.462928, -1.325076, 0, 0, 1, 1, 1,
0.5812823, 0.7171752, 1.492701, 1, 0, 0, 1, 1,
0.5821237, 0.05453456, 1.812428, 1, 0, 0, 1, 1,
0.5828718, 0.2350626, 0.6104105, 1, 0, 0, 1, 1,
0.5855228, 0.7591853, 1.619921, 1, 0, 0, 1, 1,
0.5888302, -2.236908, 2.43448, 1, 0, 0, 1, 1,
0.5894557, 0.2846276, 1.102542, 0, 0, 0, 1, 1,
0.5945265, 0.2036435, 2.867817, 0, 0, 0, 1, 1,
0.5954426, 0.1712175, -0.8950249, 0, 0, 0, 1, 1,
0.6027374, -0.615965, 2.8058, 0, 0, 0, 1, 1,
0.6032534, 0.4091429, 0.606561, 0, 0, 0, 1, 1,
0.6051761, -0.4901491, 3.102183, 0, 0, 0, 1, 1,
0.6083038, -1.500337, 4.940661, 0, 0, 0, 1, 1,
0.6134984, 0.3304514, 2.731847, 1, 1, 1, 1, 1,
0.6231776, -1.275506, 1.251379, 1, 1, 1, 1, 1,
0.6294129, -0.6796882, 1.728243, 1, 1, 1, 1, 1,
0.6308717, 0.4378735, 0.3422676, 1, 1, 1, 1, 1,
0.6341606, -0.5976253, 1.598824, 1, 1, 1, 1, 1,
0.6356229, -0.7186153, 1.923478, 1, 1, 1, 1, 1,
0.6386302, 0.227294, 3.172843, 1, 1, 1, 1, 1,
0.6394823, 1.264738, 1.163786, 1, 1, 1, 1, 1,
0.6413562, -0.7649696, 5.085526, 1, 1, 1, 1, 1,
0.6424094, -0.4456311, 1.362631, 1, 1, 1, 1, 1,
0.6429642, -0.09736248, 2.391985, 1, 1, 1, 1, 1,
0.6440667, 2.908871, 0.255396, 1, 1, 1, 1, 1,
0.6466756, 0.4264701, -0.2415397, 1, 1, 1, 1, 1,
0.6489301, -0.8807042, 1.93386, 1, 1, 1, 1, 1,
0.6490468, 0.5059071, 1.522803, 1, 1, 1, 1, 1,
0.6497828, 0.8129835, 0.0799771, 0, 0, 1, 1, 1,
0.6558621, 1.654245, 1.334515, 1, 0, 0, 1, 1,
0.6583117, -0.2258322, 1.332726, 1, 0, 0, 1, 1,
0.6590932, 1.050305, 1.298638, 1, 0, 0, 1, 1,
0.6796159, 0.09304704, 3.101308, 1, 0, 0, 1, 1,
0.6800261, -0.3839418, 4.072225, 1, 0, 0, 1, 1,
0.6802939, 1.161724, 0.7999357, 0, 0, 0, 1, 1,
0.6839825, 0.9310676, 0.5421798, 0, 0, 0, 1, 1,
0.688077, 0.6474267, 0.2484043, 0, 0, 0, 1, 1,
0.6908491, 0.01630102, 1.309177, 0, 0, 0, 1, 1,
0.6909549, -0.1083133, 1.22744, 0, 0, 0, 1, 1,
0.6919236, -0.49229, 0.9297418, 0, 0, 0, 1, 1,
0.696132, 0.1393383, 1.995893, 0, 0, 0, 1, 1,
0.6983934, 1.25076, 0.6183758, 1, 1, 1, 1, 1,
0.700327, 0.9834398, -0.69506, 1, 1, 1, 1, 1,
0.7016947, 0.1862961, 0.9809426, 1, 1, 1, 1, 1,
0.7018849, 0.9393156, -0.838842, 1, 1, 1, 1, 1,
0.7063594, 0.8032981, 1.934466, 1, 1, 1, 1, 1,
0.7086166, 0.744297, 1.954829, 1, 1, 1, 1, 1,
0.7089296, -0.7884136, 2.575463, 1, 1, 1, 1, 1,
0.7100299, -0.8080266, 1.53002, 1, 1, 1, 1, 1,
0.7182444, -0.2324235, 1.898293, 1, 1, 1, 1, 1,
0.7203353, 0.974409, 0.9935873, 1, 1, 1, 1, 1,
0.7203922, -1.614851, 3.234453, 1, 1, 1, 1, 1,
0.7236156, -0.6168857, 2.003557, 1, 1, 1, 1, 1,
0.7259598, 0.2289037, 1.404456, 1, 1, 1, 1, 1,
0.7306297, 0.4515132, 1.823265, 1, 1, 1, 1, 1,
0.7315135, -1.335591, 3.878002, 1, 1, 1, 1, 1,
0.7329075, 0.6483047, 2.225075, 0, 0, 1, 1, 1,
0.7350631, 0.1743019, 1.995814, 1, 0, 0, 1, 1,
0.7377748, -0.04452561, 1.47207, 1, 0, 0, 1, 1,
0.7394696, -0.06419202, 2.856832, 1, 0, 0, 1, 1,
0.7422584, 0.2033615, 3.684582, 1, 0, 0, 1, 1,
0.7480686, -0.7725375, 3.048787, 1, 0, 0, 1, 1,
0.7492117, -0.6878592, 1.986298, 0, 0, 0, 1, 1,
0.7510446, 0.8211863, 1.173906, 0, 0, 0, 1, 1,
0.7518134, 1.559806, -0.4164503, 0, 0, 0, 1, 1,
0.7522612, 0.6678663, -0.7115205, 0, 0, 0, 1, 1,
0.7633803, -1.457226, 2.739381, 0, 0, 0, 1, 1,
0.7642661, -0.03807544, 0.3386508, 0, 0, 0, 1, 1,
0.7667837, 1.238654, 0.3421703, 0, 0, 0, 1, 1,
0.7685953, -2.310277, 2.248019, 1, 1, 1, 1, 1,
0.7767128, 0.6484867, 0.1204896, 1, 1, 1, 1, 1,
0.7811846, 1.257472, 0.4489578, 1, 1, 1, 1, 1,
0.7930652, 0.5018177, 3.016697, 1, 1, 1, 1, 1,
0.7960308, 0.2173288, 2.14254, 1, 1, 1, 1, 1,
0.7962027, 0.6106588, 1.779047, 1, 1, 1, 1, 1,
0.7996141, 0.1574675, 2.041225, 1, 1, 1, 1, 1,
0.8022943, 0.04386607, 1.806808, 1, 1, 1, 1, 1,
0.8085912, -0.2078432, 2.358557, 1, 1, 1, 1, 1,
0.8118307, 0.07834749, 1.029175, 1, 1, 1, 1, 1,
0.8136027, 0.1429421, 1.694385, 1, 1, 1, 1, 1,
0.8230813, 1.731388, 0.6893067, 1, 1, 1, 1, 1,
0.8279629, 1.49324, 0.9925398, 1, 1, 1, 1, 1,
0.8308071, 0.3541336, -0.3922037, 1, 1, 1, 1, 1,
0.8316352, -0.07854053, 1.250488, 1, 1, 1, 1, 1,
0.8339852, -1.066226, 3.611073, 0, 0, 1, 1, 1,
0.8400448, -0.4828309, 2.128208, 1, 0, 0, 1, 1,
0.8411866, -0.1361153, 2.153584, 1, 0, 0, 1, 1,
0.8444896, 1.45571, 1.029873, 1, 0, 0, 1, 1,
0.8565953, -0.8097011, 3.294962, 1, 0, 0, 1, 1,
0.8611456, -1.913367, 1.584613, 1, 0, 0, 1, 1,
0.8636447, -0.4260635, 1.963632, 0, 0, 0, 1, 1,
0.8667484, -0.8529561, 1.992243, 0, 0, 0, 1, 1,
0.8718807, -0.1738489, 2.000641, 0, 0, 0, 1, 1,
0.8723531, -0.8055488, 2.11237, 0, 0, 0, 1, 1,
0.8754938, -1.258561, 0.6999078, 0, 0, 0, 1, 1,
0.8810554, -0.6663034, 1.527066, 0, 0, 0, 1, 1,
0.8859413, 1.240091, 0.713244, 0, 0, 0, 1, 1,
0.9066321, -2.614318, 3.323663, 1, 1, 1, 1, 1,
0.9075028, 0.06692531, 2.487252, 1, 1, 1, 1, 1,
0.9082143, -0.08256438, 2.396174, 1, 1, 1, 1, 1,
0.9082263, -1.030112, 1.456564, 1, 1, 1, 1, 1,
0.9090948, -0.6310344, 1.465897, 1, 1, 1, 1, 1,
0.9185733, 0.6036109, 3.40538, 1, 1, 1, 1, 1,
0.9218123, 1.457632, 0.8626952, 1, 1, 1, 1, 1,
0.9268785, 0.4963779, 0.7950506, 1, 1, 1, 1, 1,
0.9293486, -0.1913923, 0.98375, 1, 1, 1, 1, 1,
0.9317016, -0.4989173, 2.482988, 1, 1, 1, 1, 1,
0.9343101, -1.242089, 2.323101, 1, 1, 1, 1, 1,
0.9391098, -0.795006, 1.413704, 1, 1, 1, 1, 1,
0.9413164, 1.461255, 0.01375691, 1, 1, 1, 1, 1,
0.946224, 1.037693, -1.34002, 1, 1, 1, 1, 1,
0.9660006, 0.9043064, 0.2787085, 1, 1, 1, 1, 1,
0.9715937, 0.9266883, 1.659045, 0, 0, 1, 1, 1,
0.9732173, -0.4579887, 0.797761, 1, 0, 0, 1, 1,
0.980962, -1.14878, 1.474067, 1, 0, 0, 1, 1,
0.9828379, -0.03396215, 2.428988, 1, 0, 0, 1, 1,
0.9870955, -1.432609, 0.4391305, 1, 0, 0, 1, 1,
0.9874029, 1.000478, 0.2219902, 1, 0, 0, 1, 1,
0.9942685, -0.2287149, 2.025554, 0, 0, 0, 1, 1,
0.998653, -0.3303705, 2.322663, 0, 0, 0, 1, 1,
0.99898, 0.8066607, -0.7498516, 0, 0, 0, 1, 1,
1.006034, -1.36576, 2.921319, 0, 0, 0, 1, 1,
1.013086, 1.137877, 1.430872, 0, 0, 0, 1, 1,
1.013662, -0.3993151, 1.152367, 0, 0, 0, 1, 1,
1.014943, -0.7600627, 3.022066, 0, 0, 0, 1, 1,
1.02201, 1.271456, 0.7052758, 1, 1, 1, 1, 1,
1.025733, -0.8977745, 1.10956, 1, 1, 1, 1, 1,
1.039477, -1.050624, 2.385805, 1, 1, 1, 1, 1,
1.043889, -0.6543039, 1.13877, 1, 1, 1, 1, 1,
1.046107, 0.2294517, 0.7838845, 1, 1, 1, 1, 1,
1.051553, 2.153117, 1.45294, 1, 1, 1, 1, 1,
1.06462, -0.5417179, 1.688564, 1, 1, 1, 1, 1,
1.066046, -1.356794, 1.191222, 1, 1, 1, 1, 1,
1.066281, -1.602289, 3.206209, 1, 1, 1, 1, 1,
1.06745, 0.6051416, 1.571828, 1, 1, 1, 1, 1,
1.068061, 1.959897, -0.04411962, 1, 1, 1, 1, 1,
1.068356, -0.3711073, 1.970431, 1, 1, 1, 1, 1,
1.078865, -0.7414667, 1.4723, 1, 1, 1, 1, 1,
1.080561, -1.532211, 2.604634, 1, 1, 1, 1, 1,
1.085958, 0.6965861, 0.7893263, 1, 1, 1, 1, 1,
1.091308, -0.2755904, 2.521452, 0, 0, 1, 1, 1,
1.09217, -1.03915, 1.476482, 1, 0, 0, 1, 1,
1.094122, -1.223267, 1.440159, 1, 0, 0, 1, 1,
1.099263, 0.3244649, 1.237297, 1, 0, 0, 1, 1,
1.111308, 1.481858, 0.6815172, 1, 0, 0, 1, 1,
1.111444, -0.02685468, 0.2841365, 1, 0, 0, 1, 1,
1.126606, -0.6769522, 2.457575, 0, 0, 0, 1, 1,
1.130847, 0.2706032, 1.417363, 0, 0, 0, 1, 1,
1.13632, 0.7913864, 2.65318, 0, 0, 0, 1, 1,
1.136333, -1.828448, 3.165357, 0, 0, 0, 1, 1,
1.138782, -0.2509772, 2.496263, 0, 0, 0, 1, 1,
1.150226, -0.4049831, 0.772182, 0, 0, 0, 1, 1,
1.151532, -0.8037227, 1.763574, 0, 0, 0, 1, 1,
1.154194, 0.7075042, 1.810472, 1, 1, 1, 1, 1,
1.157011, -0.2505213, 2.616286, 1, 1, 1, 1, 1,
1.162106, -2.883343, 2.541747, 1, 1, 1, 1, 1,
1.162729, -1.007336, 2.285002, 1, 1, 1, 1, 1,
1.163769, -1.395354, 0.2580335, 1, 1, 1, 1, 1,
1.163984, -0.1046508, 1.06602, 1, 1, 1, 1, 1,
1.17797, -0.9299496, 2.818258, 1, 1, 1, 1, 1,
1.179568, 0.1931406, 1.877448, 1, 1, 1, 1, 1,
1.182452, -0.9349609, 1.555918, 1, 1, 1, 1, 1,
1.184101, -0.6843433, 2.50296, 1, 1, 1, 1, 1,
1.186187, 0.5917686, 2.349654, 1, 1, 1, 1, 1,
1.209112, -0.7286011, 3.38832, 1, 1, 1, 1, 1,
1.213569, 0.006194749, 2.22434, 1, 1, 1, 1, 1,
1.214641, 0.003754344, 0.7441415, 1, 1, 1, 1, 1,
1.215566, 0.4365984, 1.331003, 1, 1, 1, 1, 1,
1.221294, -0.7865834, 2.084288, 0, 0, 1, 1, 1,
1.233577, 0.2464802, 0.3556632, 1, 0, 0, 1, 1,
1.237439, -1.313395, 2.664449, 1, 0, 0, 1, 1,
1.246297, -1.145082, 4.294546, 1, 0, 0, 1, 1,
1.249682, -1.449755, 1.738026, 1, 0, 0, 1, 1,
1.254353, -0.1366904, 0.8859188, 1, 0, 0, 1, 1,
1.25771, -0.2343953, 2.618785, 0, 0, 0, 1, 1,
1.272269, 1.059196, 2.605002, 0, 0, 0, 1, 1,
1.274553, 1.856027, 0.4785293, 0, 0, 0, 1, 1,
1.278057, 0.02764515, 0.5556944, 0, 0, 0, 1, 1,
1.27852, 1.185998, 0.7981513, 0, 0, 0, 1, 1,
1.288246, -0.7951641, 1.793923, 0, 0, 0, 1, 1,
1.290969, -0.692129, -0.7146288, 0, 0, 0, 1, 1,
1.302527, -0.254706, 1.766135, 1, 1, 1, 1, 1,
1.304239, -0.09969106, 0.0682769, 1, 1, 1, 1, 1,
1.306376, -0.1167099, 1.307828, 1, 1, 1, 1, 1,
1.306766, -0.2042275, 1.140311, 1, 1, 1, 1, 1,
1.32094, -0.5617629, 0.7262505, 1, 1, 1, 1, 1,
1.346846, 0.04571342, 0.9138047, 1, 1, 1, 1, 1,
1.367713, 1.489104, 0.7471234, 1, 1, 1, 1, 1,
1.370609, 0.3303318, 1.252639, 1, 1, 1, 1, 1,
1.372007, 0.2072392, 1.380242, 1, 1, 1, 1, 1,
1.382005, -0.1230543, 1.756482, 1, 1, 1, 1, 1,
1.392391, 0.5105851, 0.2157231, 1, 1, 1, 1, 1,
1.393095, -0.8561032, 1.948591, 1, 1, 1, 1, 1,
1.394225, -1.127359, 1.675013, 1, 1, 1, 1, 1,
1.400088, 0.225196, -0.9768327, 1, 1, 1, 1, 1,
1.401338, -0.04173776, 1.388078, 1, 1, 1, 1, 1,
1.412838, 0.203182, 1.894553, 0, 0, 1, 1, 1,
1.41662, 0.4455334, 3.520622, 1, 0, 0, 1, 1,
1.416879, 0.4711323, 0.9381826, 1, 0, 0, 1, 1,
1.417505, 0.1828995, 2.068179, 1, 0, 0, 1, 1,
1.426803, -1.019124, 2.533176, 1, 0, 0, 1, 1,
1.450794, -0.0799009, 1.544051, 1, 0, 0, 1, 1,
1.459078, 0.2306655, 0.7099321, 0, 0, 0, 1, 1,
1.470777, -0.1177571, 1.701569, 0, 0, 0, 1, 1,
1.476713, -2.267299, 2.198785, 0, 0, 0, 1, 1,
1.484832, 0.3611706, 1.112819, 0, 0, 0, 1, 1,
1.485086, -0.5803575, 1.574841, 0, 0, 0, 1, 1,
1.487407, 1.2109, 1.361341, 0, 0, 0, 1, 1,
1.501762, -0.09919751, 2.27664, 0, 0, 0, 1, 1,
1.516089, -1.277469, 1.935294, 1, 1, 1, 1, 1,
1.520516, -0.05987949, 0.4682991, 1, 1, 1, 1, 1,
1.547086, -0.2665119, 1.227197, 1, 1, 1, 1, 1,
1.563241, 0.5140326, -0.3327377, 1, 1, 1, 1, 1,
1.599352, 1.446824, 1.02524, 1, 1, 1, 1, 1,
1.604096, 0.02158737, 2.758458, 1, 1, 1, 1, 1,
1.605684, 0.2246622, 2.311046, 1, 1, 1, 1, 1,
1.621869, 1.155779, 2.578235, 1, 1, 1, 1, 1,
1.641778, 0.2463147, 0.7428043, 1, 1, 1, 1, 1,
1.649423, -0.4475849, 3.038022, 1, 1, 1, 1, 1,
1.659542, 0.9768854, 1.692094, 1, 1, 1, 1, 1,
1.661829, -0.5623274, 1.640982, 1, 1, 1, 1, 1,
1.666857, -0.02160161, -0.04474026, 1, 1, 1, 1, 1,
1.698976, 0.09916293, 2.015167, 1, 1, 1, 1, 1,
1.705209, 1.199956, 0.7386881, 1, 1, 1, 1, 1,
1.712085, -0.9437437, 1.043406, 0, 0, 1, 1, 1,
1.712224, 1.527313, 0.4473881, 1, 0, 0, 1, 1,
1.73317, -2.185616, 2.424927, 1, 0, 0, 1, 1,
1.750245, -0.009250099, 1.582051, 1, 0, 0, 1, 1,
1.811548, 0.04737851, -0.3308112, 1, 0, 0, 1, 1,
1.838289, 0.4070401, 1.542253, 1, 0, 0, 1, 1,
1.855453, -0.9096697, 0.9849438, 0, 0, 0, 1, 1,
1.858563, -0.7567155, 0.3873992, 0, 0, 0, 1, 1,
1.861771, 0.05864869, 1.847905, 0, 0, 0, 1, 1,
1.885445, -2.126047, 2.336973, 0, 0, 0, 1, 1,
1.899527, -0.9767585, 0.9282252, 0, 0, 0, 1, 1,
1.908304, 0.04813109, 1.188884, 0, 0, 0, 1, 1,
1.920924, -0.9691768, 1.596632, 0, 0, 0, 1, 1,
1.938574, 1.626191, 1.106646, 1, 1, 1, 1, 1,
1.940551, -0.2495194, 3.423749, 1, 1, 1, 1, 1,
1.95739, -0.2144974, 3.051858, 1, 1, 1, 1, 1,
1.960338, -1.732063, 3.110607, 1, 1, 1, 1, 1,
1.960981, 0.8164192, 1.770783, 1, 1, 1, 1, 1,
1.961435, 2.267031, -0.07770139, 1, 1, 1, 1, 1,
1.972832, 0.09371617, 2.165496, 1, 1, 1, 1, 1,
2.009895, 1.434386, 1.305133, 1, 1, 1, 1, 1,
2.014484, 1.270171, -0.141637, 1, 1, 1, 1, 1,
2.016735, -0.8489261, 1.047359, 1, 1, 1, 1, 1,
2.035435, -1.029534, 1.305423, 1, 1, 1, 1, 1,
2.050425, -0.3235687, 1.36552, 1, 1, 1, 1, 1,
2.051971, 0.0661981, 2.194812, 1, 1, 1, 1, 1,
2.063433, 0.5340937, 0.6004769, 1, 1, 1, 1, 1,
2.078739, 0.2525481, 1.89, 1, 1, 1, 1, 1,
2.101201, -2.460599, 2.035698, 0, 0, 1, 1, 1,
2.106371, 1.232312, 0.5497231, 1, 0, 0, 1, 1,
2.119998, -0.2636538, 1.882408, 1, 0, 0, 1, 1,
2.152607, 0.4865479, 1.908541, 1, 0, 0, 1, 1,
2.18571, -0.6126262, 1.856305, 1, 0, 0, 1, 1,
2.221175, -0.6478404, 2.120547, 1, 0, 0, 1, 1,
2.256996, 0.6268713, 2.797695, 0, 0, 0, 1, 1,
2.295124, 1.050317, 2.589438, 0, 0, 0, 1, 1,
2.39689, 1.454555, 0.08907885, 0, 0, 0, 1, 1,
2.409626, -0.9137551, 2.565761, 0, 0, 0, 1, 1,
2.424665, 0.6260952, -0.6690985, 0, 0, 0, 1, 1,
2.474848, 0.2558793, 2.160849, 0, 0, 0, 1, 1,
2.476336, -0.2616293, 2.115883, 0, 0, 0, 1, 1,
2.494261, 0.137678, 1.935922, 1, 1, 1, 1, 1,
2.56423, -1.521373, 1.089741, 1, 1, 1, 1, 1,
2.573378, -0.1455812, 0.8738548, 1, 1, 1, 1, 1,
2.656928, 0.2970443, 1.113987, 1, 1, 1, 1, 1,
2.82504, 1.203843, 2.308304, 1, 1, 1, 1, 1,
2.860711, -0.3905109, 1.359224, 1, 1, 1, 1, 1,
3.053704, -0.8431579, 0.4750764, 1, 1, 1, 1, 1
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
var radius = 9.486958;
var distance = 33.32254;
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
mvMatrix.translate( 0.01072383, -0.01693892, 0.05389142 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.32254);
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
