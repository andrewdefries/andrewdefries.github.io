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
-2.728518, -0.2582527, -2.790969, 1, 0, 0, 1,
-2.703352, 0.9270924, -2.120945, 1, 0.007843138, 0, 1,
-2.511862, -0.4442551, -1.663693, 1, 0.01176471, 0, 1,
-2.504552, 0.1567397, -2.586267, 1, 0.01960784, 0, 1,
-2.5021, -0.900313, -1.706909, 1, 0.02352941, 0, 1,
-2.449628, 1.722193, -0.5843928, 1, 0.03137255, 0, 1,
-2.363002, -0.7104377, -0.7445426, 1, 0.03529412, 0, 1,
-2.35754, -1.737833, -2.720436, 1, 0.04313726, 0, 1,
-2.344217, 0.215158, -1.821524, 1, 0.04705882, 0, 1,
-2.341149, 0.4547393, -0.1800584, 1, 0.05490196, 0, 1,
-2.3305, 1.413361, -1.415354, 1, 0.05882353, 0, 1,
-2.249027, -0.5376883, -0.7657727, 1, 0.06666667, 0, 1,
-2.16628, -0.0560492, -0.5140646, 1, 0.07058824, 0, 1,
-2.095575, -0.7098534, -1.548774, 1, 0.07843138, 0, 1,
-2.083121, 0.1606017, -0.6271439, 1, 0.08235294, 0, 1,
-2.079318, 0.8762901, -1.609142, 1, 0.09019608, 0, 1,
-2.078528, -1.256569, -3.566981, 1, 0.09411765, 0, 1,
-2.00446, -0.9716377, -2.5712, 1, 0.1019608, 0, 1,
-1.978566, 0.699271, -1.812828, 1, 0.1098039, 0, 1,
-1.972121, 1.183636, -0.503467, 1, 0.1137255, 0, 1,
-1.932923, -0.5874039, -2.705182, 1, 0.1215686, 0, 1,
-1.875952, -0.05894646, -0.521471, 1, 0.1254902, 0, 1,
-1.863629, 0.9460536, -0.2747258, 1, 0.1333333, 0, 1,
-1.846433, -0.8000517, -2.277094, 1, 0.1372549, 0, 1,
-1.8339, 0.2142054, -3.676365, 1, 0.145098, 0, 1,
-1.829878, 0.7777049, -0.736335, 1, 0.1490196, 0, 1,
-1.829306, -0.2210161, -2.610536, 1, 0.1568628, 0, 1,
-1.805633, -0.985265, -2.640544, 1, 0.1607843, 0, 1,
-1.800577, 1.143871, -0.8772463, 1, 0.1686275, 0, 1,
-1.769861, -0.3316616, -0.6135573, 1, 0.172549, 0, 1,
-1.750758, 0.5609437, -1.840118, 1, 0.1803922, 0, 1,
-1.738401, 0.3745292, -1.348338, 1, 0.1843137, 0, 1,
-1.734084, 0.5585495, -0.4915234, 1, 0.1921569, 0, 1,
-1.723959, 2.126167, 0.5214214, 1, 0.1960784, 0, 1,
-1.715213, 1.933286, -2.132783, 1, 0.2039216, 0, 1,
-1.682531, 0.7720402, -0.9719684, 1, 0.2117647, 0, 1,
-1.65506, -0.3223068, -0.6383289, 1, 0.2156863, 0, 1,
-1.644933, -1.572293, -1.31156, 1, 0.2235294, 0, 1,
-1.641937, -0.1239085, -1.529894, 1, 0.227451, 0, 1,
-1.634933, 0.2755574, -2.420671, 1, 0.2352941, 0, 1,
-1.634343, 0.2147385, -1.997099, 1, 0.2392157, 0, 1,
-1.631694, 0.5815939, -1.992248, 1, 0.2470588, 0, 1,
-1.60641, 0.7635914, -2.193399, 1, 0.2509804, 0, 1,
-1.599127, -0.05225886, -3.605845, 1, 0.2588235, 0, 1,
-1.595335, -0.008859616, -2.73215, 1, 0.2627451, 0, 1,
-1.583495, -0.6530685, -0.6933594, 1, 0.2705882, 0, 1,
-1.582819, -0.4331018, -1.993769, 1, 0.2745098, 0, 1,
-1.549617, -0.5877389, -0.3166729, 1, 0.282353, 0, 1,
-1.539233, 1.018441, -0.1591639, 1, 0.2862745, 0, 1,
-1.538198, 0.4073209, -1.818751, 1, 0.2941177, 0, 1,
-1.526712, -1.909757, -3.429873, 1, 0.3019608, 0, 1,
-1.514877, 0.1203266, -1.719098, 1, 0.3058824, 0, 1,
-1.511118, 0.4248787, -0.8438144, 1, 0.3137255, 0, 1,
-1.510365, -0.4601919, -1.159325, 1, 0.3176471, 0, 1,
-1.499829, -0.7027763, -1.626045, 1, 0.3254902, 0, 1,
-1.484947, 0.09642359, -2.565631, 1, 0.3294118, 0, 1,
-1.458372, 1.055935, 1.181339, 1, 0.3372549, 0, 1,
-1.447245, 1.979607, -1.234935, 1, 0.3411765, 0, 1,
-1.445751, -1.471368, -2.395961, 1, 0.3490196, 0, 1,
-1.438326, -0.5107173, -1.539117, 1, 0.3529412, 0, 1,
-1.427059, -1.376812, -2.603167, 1, 0.3607843, 0, 1,
-1.424836, 0.1081396, -2.976475, 1, 0.3647059, 0, 1,
-1.423512, -0.7381095, -2.801531, 1, 0.372549, 0, 1,
-1.421111, 0.6731799, -0.2281788, 1, 0.3764706, 0, 1,
-1.411536, 0.3150751, -0.01178939, 1, 0.3843137, 0, 1,
-1.379028, -3.033514, -4.229273, 1, 0.3882353, 0, 1,
-1.370779, -0.4981021, -1.439419, 1, 0.3960784, 0, 1,
-1.364651, -0.3085578, -1.903346, 1, 0.4039216, 0, 1,
-1.3639, -1.215127, -1.833313, 1, 0.4078431, 0, 1,
-1.360652, -0.7273957, -3.663478, 1, 0.4156863, 0, 1,
-1.360173, 0.4428688, -2.072206, 1, 0.4196078, 0, 1,
-1.358244, 0.08162243, -2.703861, 1, 0.427451, 0, 1,
-1.347385, -0.5885043, -0.2856665, 1, 0.4313726, 0, 1,
-1.344098, 0.6401961, -2.47612, 1, 0.4392157, 0, 1,
-1.344071, -1.058826, -4.299627, 1, 0.4431373, 0, 1,
-1.340732, 0.1804047, -2.513342, 1, 0.4509804, 0, 1,
-1.332311, -1.05115, -1.657532, 1, 0.454902, 0, 1,
-1.329977, 1.800077, 1.550633, 1, 0.4627451, 0, 1,
-1.325286, 0.002245885, -1.719113, 1, 0.4666667, 0, 1,
-1.32338, -0.7511914, -2.507962, 1, 0.4745098, 0, 1,
-1.316535, -0.4158212, -4.093296, 1, 0.4784314, 0, 1,
-1.30865, -0.001450733, -0.546571, 1, 0.4862745, 0, 1,
-1.304916, 1.594097, -0.9979302, 1, 0.4901961, 0, 1,
-1.301682, 0.4389021, -1.998108, 1, 0.4980392, 0, 1,
-1.298426, -1.779611, -3.321767, 1, 0.5058824, 0, 1,
-1.296963, -1.332234, -1.563882, 1, 0.509804, 0, 1,
-1.29162, 1.019904, -1.718809, 1, 0.5176471, 0, 1,
-1.284307, -1.236287, -2.168033, 1, 0.5215687, 0, 1,
-1.272796, -0.9457807, -3.288136, 1, 0.5294118, 0, 1,
-1.272597, -0.3382892, -1.624611, 1, 0.5333334, 0, 1,
-1.263619, -0.6111042, -1.762677, 1, 0.5411765, 0, 1,
-1.260413, -0.3133508, -2.104286, 1, 0.5450981, 0, 1,
-1.259967, -2.068495, -3.623199, 1, 0.5529412, 0, 1,
-1.25987, -0.1915321, -0.5322528, 1, 0.5568628, 0, 1,
-1.248088, -0.6431014, -2.555339, 1, 0.5647059, 0, 1,
-1.247146, 0.168343, -1.222668, 1, 0.5686275, 0, 1,
-1.234477, 1.18564, -0.6230091, 1, 0.5764706, 0, 1,
-1.22991, -0.9721856, -2.389404, 1, 0.5803922, 0, 1,
-1.227616, 0.1509947, -0.366392, 1, 0.5882353, 0, 1,
-1.225343, 0.01745641, -3.041923, 1, 0.5921569, 0, 1,
-1.22524, -0.2499834, -2.179978, 1, 0.6, 0, 1,
-1.209079, -2.482212, -2.416459, 1, 0.6078432, 0, 1,
-1.204102, -1.442291, -3.707748, 1, 0.6117647, 0, 1,
-1.203915, -0.2349752, -0.1164199, 1, 0.6196079, 0, 1,
-1.192269, 1.266369, 0.7712811, 1, 0.6235294, 0, 1,
-1.176752, -2.413826, -3.620069, 1, 0.6313726, 0, 1,
-1.173388, 2.011228, -0.3340588, 1, 0.6352941, 0, 1,
-1.173302, 1.949332, 0.05142385, 1, 0.6431373, 0, 1,
-1.16142, -0.4333706, 0.1283944, 1, 0.6470588, 0, 1,
-1.157922, -0.1620646, -1.171388, 1, 0.654902, 0, 1,
-1.155625, 1.006961, -0.5715067, 1, 0.6588235, 0, 1,
-1.151334, -0.1020492, -2.485498, 1, 0.6666667, 0, 1,
-1.147028, -0.6798974, -1.608372, 1, 0.6705883, 0, 1,
-1.146692, -0.08161735, -0.08249873, 1, 0.6784314, 0, 1,
-1.141667, -1.83194, -2.32133, 1, 0.682353, 0, 1,
-1.13918, -0.1715682, -2.841044, 1, 0.6901961, 0, 1,
-1.137834, -0.02120787, -0.9144812, 1, 0.6941177, 0, 1,
-1.137204, -0.8164039, -3.166215, 1, 0.7019608, 0, 1,
-1.133489, 0.7179933, -1.897681, 1, 0.7098039, 0, 1,
-1.131145, -0.2854018, -2.775252, 1, 0.7137255, 0, 1,
-1.130946, -0.02200049, -3.412685, 1, 0.7215686, 0, 1,
-1.127847, 0.2973011, -0.653653, 1, 0.7254902, 0, 1,
-1.124813, -2.112213, -3.657994, 1, 0.7333333, 0, 1,
-1.12118, -0.4412104, -3.125467, 1, 0.7372549, 0, 1,
-1.11976, 2.228243, 0.1036256, 1, 0.7450981, 0, 1,
-1.119549, 0.7296557, -1.858582, 1, 0.7490196, 0, 1,
-1.116115, 1.004398, 0.5068157, 1, 0.7568628, 0, 1,
-1.111834, -0.09861104, -1.879274, 1, 0.7607843, 0, 1,
-1.103092, -0.5771575, -3.240062, 1, 0.7686275, 0, 1,
-1.09477, -0.0502668, -2.619213, 1, 0.772549, 0, 1,
-1.093713, -0.2427664, -1.530748, 1, 0.7803922, 0, 1,
-1.087577, 1.045953, -0.3354918, 1, 0.7843137, 0, 1,
-1.079891, 1.063694, -0.7121853, 1, 0.7921569, 0, 1,
-1.079371, -0.4825105, -2.627304, 1, 0.7960784, 0, 1,
-1.077297, 0.6082669, -0.6205802, 1, 0.8039216, 0, 1,
-1.076722, -0.1649954, -0.9988934, 1, 0.8117647, 0, 1,
-1.066503, -1.061808, -1.332517, 1, 0.8156863, 0, 1,
-1.065916, 1.974435, -1.064764, 1, 0.8235294, 0, 1,
-1.063025, 0.09528505, -2.603123, 1, 0.827451, 0, 1,
-1.060414, 0.7080872, -2.961692, 1, 0.8352941, 0, 1,
-1.05753, -2.025962, -2.87442, 1, 0.8392157, 0, 1,
-1.057074, 0.6259647, -1.076379, 1, 0.8470588, 0, 1,
-1.051409, 0.3066285, -2.669381, 1, 0.8509804, 0, 1,
-1.04684, -1.457702, -1.185467, 1, 0.8588235, 0, 1,
-1.04282, 0.6952996, 1.310465, 1, 0.8627451, 0, 1,
-1.034935, -0.3919114, -0.2695687, 1, 0.8705882, 0, 1,
-1.034572, 0.3089566, -1.972928, 1, 0.8745098, 0, 1,
-1.034295, 0.4918234, -1.363295, 1, 0.8823529, 0, 1,
-1.022714, 1.089352, -0.4620669, 1, 0.8862745, 0, 1,
-1.020306, 2.295135, -0.5826856, 1, 0.8941177, 0, 1,
-1.019416, 0.04069054, -3.160499, 1, 0.8980392, 0, 1,
-1.017746, -2.067703, -4.140769, 1, 0.9058824, 0, 1,
-1.014343, 0.8716916, -2.235342, 1, 0.9137255, 0, 1,
-1.013362, -1.2302, -2.289127, 1, 0.9176471, 0, 1,
-1.005589, -0.1452151, -1.43265, 1, 0.9254902, 0, 1,
-1.003283, 0.2738784, -2.975712, 1, 0.9294118, 0, 1,
-0.9884029, -0.8141155, -4.004296, 1, 0.9372549, 0, 1,
-0.9857455, -0.806299, -2.252832, 1, 0.9411765, 0, 1,
-0.9846535, -0.04565633, -0.5987827, 1, 0.9490196, 0, 1,
-0.9827645, -0.2857846, -1.683724, 1, 0.9529412, 0, 1,
-0.9795246, 1.09889, -0.8504559, 1, 0.9607843, 0, 1,
-0.9768042, -1.009305, -0.6763518, 1, 0.9647059, 0, 1,
-0.9758846, 0.7958005, -0.02582718, 1, 0.972549, 0, 1,
-0.964779, 0.7791629, 0.270411, 1, 0.9764706, 0, 1,
-0.9628457, -0.9263399, -2.123763, 1, 0.9843137, 0, 1,
-0.9625557, 1.610464, -0.5520735, 1, 0.9882353, 0, 1,
-0.9593144, -0.8344852, -1.317691, 1, 0.9960784, 0, 1,
-0.9509149, -0.1630234, -2.450896, 0.9960784, 1, 0, 1,
-0.9475778, -1.248084, -2.40415, 0.9921569, 1, 0, 1,
-0.9462534, 0.6885992, -0.8164938, 0.9843137, 1, 0, 1,
-0.9387487, 0.0667006, -2.49147, 0.9803922, 1, 0, 1,
-0.9357994, 2.138642, -0.5887241, 0.972549, 1, 0, 1,
-0.9357738, -1.948624, -1.328812, 0.9686275, 1, 0, 1,
-0.9345682, 0.685885, -0.3415551, 0.9607843, 1, 0, 1,
-0.9247527, 0.8429426, 1.074757, 0.9568627, 1, 0, 1,
-0.9237036, -1.257846, -2.191119, 0.9490196, 1, 0, 1,
-0.9159917, 1.414073, -1.411394, 0.945098, 1, 0, 1,
-0.9133672, 1.706824, -0.4156474, 0.9372549, 1, 0, 1,
-0.9132611, 0.1001242, 0.426679, 0.9333333, 1, 0, 1,
-0.9086555, -0.2171276, -1.612605, 0.9254902, 1, 0, 1,
-0.9026942, -0.0318989, -0.8502615, 0.9215686, 1, 0, 1,
-0.8956993, 0.3463172, -0.281546, 0.9137255, 1, 0, 1,
-0.8887532, 0.6425435, -0.8080732, 0.9098039, 1, 0, 1,
-0.8830858, 0.7064548, -2.005004, 0.9019608, 1, 0, 1,
-0.8797143, 0.3996023, -2.868386, 0.8941177, 1, 0, 1,
-0.8744807, -1.193274, -2.182489, 0.8901961, 1, 0, 1,
-0.8703643, -1.55747, -1.16615, 0.8823529, 1, 0, 1,
-0.8659083, -0.7103909, -1.507182, 0.8784314, 1, 0, 1,
-0.8616203, -2.348882, -1.892934, 0.8705882, 1, 0, 1,
-0.860309, -1.028547, -2.483648, 0.8666667, 1, 0, 1,
-0.8569307, 0.01565442, -2.537309, 0.8588235, 1, 0, 1,
-0.8528006, 0.06343609, -2.189614, 0.854902, 1, 0, 1,
-0.8505949, 0.7925364, -2.688854, 0.8470588, 1, 0, 1,
-0.8493807, -1.091302, -1.63793, 0.8431373, 1, 0, 1,
-0.8454649, -2.217322, -5.337218, 0.8352941, 1, 0, 1,
-0.8453696, -0.3661358, -1.97812, 0.8313726, 1, 0, 1,
-0.8395631, 1.167012, -0.1790796, 0.8235294, 1, 0, 1,
-0.8382698, -1.144082, -1.985711, 0.8196079, 1, 0, 1,
-0.8371166, -1.930241, -2.867119, 0.8117647, 1, 0, 1,
-0.83636, -0.5942115, -2.929848, 0.8078431, 1, 0, 1,
-0.8352605, -1.978886, -3.302884, 0.8, 1, 0, 1,
-0.8276065, 0.09634455, -1.492826, 0.7921569, 1, 0, 1,
-0.8244185, 1.379506, -0.8911921, 0.7882353, 1, 0, 1,
-0.8235555, -0.9130775, -4.073683, 0.7803922, 1, 0, 1,
-0.8139961, -2.833396, -2.388723, 0.7764706, 1, 0, 1,
-0.7984596, -0.3534385, -1.97223, 0.7686275, 1, 0, 1,
-0.7957963, 1.834275, 0.9431523, 0.7647059, 1, 0, 1,
-0.7953145, 1.729105, -1.203906, 0.7568628, 1, 0, 1,
-0.7950932, -1.30661, -3.254695, 0.7529412, 1, 0, 1,
-0.7911265, -0.3051717, -0.5160248, 0.7450981, 1, 0, 1,
-0.7907035, 0.3590896, -2.5752, 0.7411765, 1, 0, 1,
-0.7891331, 0.1940866, -1.107682, 0.7333333, 1, 0, 1,
-0.7862699, -2.484953, -4.178543, 0.7294118, 1, 0, 1,
-0.7848571, 0.1443958, -2.448774, 0.7215686, 1, 0, 1,
-0.7836413, -0.2726741, -2.021246, 0.7176471, 1, 0, 1,
-0.7816454, 0.1010659, -2.009707, 0.7098039, 1, 0, 1,
-0.7811424, -0.1233186, -1.014552, 0.7058824, 1, 0, 1,
-0.7755781, 2.094524, 1.444659, 0.6980392, 1, 0, 1,
-0.7722868, -0.5621302, -0.6050665, 0.6901961, 1, 0, 1,
-0.7709823, -1.20307, -1.9221, 0.6862745, 1, 0, 1,
-0.7631354, -0.8049787, -3.597916, 0.6784314, 1, 0, 1,
-0.7624709, -1.108882, -4.115405, 0.6745098, 1, 0, 1,
-0.7587324, -0.761548, -3.159897, 0.6666667, 1, 0, 1,
-0.7505163, 0.228776, -1.571707, 0.6627451, 1, 0, 1,
-0.7494416, -0.8283249, -1.271093, 0.654902, 1, 0, 1,
-0.7482545, -0.7670467, -2.958664, 0.6509804, 1, 0, 1,
-0.7480676, -1.901659, -2.612531, 0.6431373, 1, 0, 1,
-0.7460966, 1.319807, -0.267824, 0.6392157, 1, 0, 1,
-0.7451911, -1.230084, -2.717567, 0.6313726, 1, 0, 1,
-0.7382037, 1.228838, -0.3697784, 0.627451, 1, 0, 1,
-0.7369921, -0.424556, -1.020703, 0.6196079, 1, 0, 1,
-0.7355143, -1.331138, -3.725165, 0.6156863, 1, 0, 1,
-0.735251, 0.04700487, -1.234205, 0.6078432, 1, 0, 1,
-0.7312387, 0.06830987, -0.8612481, 0.6039216, 1, 0, 1,
-0.7197996, -0.689181, -2.651844, 0.5960785, 1, 0, 1,
-0.7189619, 1.370227, -0.3962087, 0.5882353, 1, 0, 1,
-0.7146674, 0.3174684, -2.61859, 0.5843138, 1, 0, 1,
-0.712914, 1.956847, 1.328102, 0.5764706, 1, 0, 1,
-0.7114332, -0.09169659, 0.3047892, 0.572549, 1, 0, 1,
-0.7113744, 1.053108, -0.5875395, 0.5647059, 1, 0, 1,
-0.7064463, -0.7217808, -3.400182, 0.5607843, 1, 0, 1,
-0.7062068, 0.09105261, -0.1420429, 0.5529412, 1, 0, 1,
-0.7054727, 0.4210252, -2.230774, 0.5490196, 1, 0, 1,
-0.7046112, 0.175594, -2.653645, 0.5411765, 1, 0, 1,
-0.7033637, -0.05967744, -0.9509915, 0.5372549, 1, 0, 1,
-0.7031056, -0.3829099, -1.231663, 0.5294118, 1, 0, 1,
-0.7024699, -0.8001652, -1.23542, 0.5254902, 1, 0, 1,
-0.6987032, -1.363206, -0.7201438, 0.5176471, 1, 0, 1,
-0.6977788, 0.3229539, -2.113335, 0.5137255, 1, 0, 1,
-0.6919668, 0.4262889, -0.5127307, 0.5058824, 1, 0, 1,
-0.6823902, -0.1707125, -0.2075576, 0.5019608, 1, 0, 1,
-0.6797621, 0.4260299, -1.258093, 0.4941176, 1, 0, 1,
-0.6795799, -1.407506, -2.738563, 0.4862745, 1, 0, 1,
-0.6781421, 0.20946, -0.2471211, 0.4823529, 1, 0, 1,
-0.6721888, 0.03241251, -1.073769, 0.4745098, 1, 0, 1,
-0.6719257, 2.772113, -0.7257267, 0.4705882, 1, 0, 1,
-0.6717749, 0.04945983, 0.4304398, 0.4627451, 1, 0, 1,
-0.668628, 0.1336375, 0.09700158, 0.4588235, 1, 0, 1,
-0.6663242, -0.471951, -3.081689, 0.4509804, 1, 0, 1,
-0.666097, 0.4501534, -2.734488, 0.4470588, 1, 0, 1,
-0.6646543, 1.841882, -1.545952, 0.4392157, 1, 0, 1,
-0.6547021, 1.002615, -2.116044, 0.4352941, 1, 0, 1,
-0.6523785, 1.298779, -1.129286, 0.427451, 1, 0, 1,
-0.6259396, 1.41085, -0.6302487, 0.4235294, 1, 0, 1,
-0.6251517, 0.5400882, 1.913811, 0.4156863, 1, 0, 1,
-0.6238759, 0.6059066, -1.910815, 0.4117647, 1, 0, 1,
-0.6130372, 0.4247674, -2.701358, 0.4039216, 1, 0, 1,
-0.6118554, 1.349542, -0.7944062, 0.3960784, 1, 0, 1,
-0.6084302, -0.04643101, -1.959422, 0.3921569, 1, 0, 1,
-0.6033112, -0.7351695, -2.516687, 0.3843137, 1, 0, 1,
-0.6005971, 0.8161908, -0.6367968, 0.3803922, 1, 0, 1,
-0.5979331, 1.044367, -0.126339, 0.372549, 1, 0, 1,
-0.5902642, -1.073113, -2.01601, 0.3686275, 1, 0, 1,
-0.5892819, 1.394373, -0.2458298, 0.3607843, 1, 0, 1,
-0.5808212, -1.618269, -3.695959, 0.3568628, 1, 0, 1,
-0.5779408, 0.6262638, -0.8984832, 0.3490196, 1, 0, 1,
-0.5759748, -1.459693, -4.607219, 0.345098, 1, 0, 1,
-0.5751197, 0.0181862, -1.959428, 0.3372549, 1, 0, 1,
-0.5712404, 0.10136, -3.929297, 0.3333333, 1, 0, 1,
-0.5672588, -0.4574448, -2.100881, 0.3254902, 1, 0, 1,
-0.5667641, -0.8958268, -2.105006, 0.3215686, 1, 0, 1,
-0.565357, -0.3891743, -0.1632154, 0.3137255, 1, 0, 1,
-0.5644164, 1.407976, -1.208422, 0.3098039, 1, 0, 1,
-0.5630049, 0.001804155, -3.164504, 0.3019608, 1, 0, 1,
-0.5617344, 1.172756, -0.2859783, 0.2941177, 1, 0, 1,
-0.5602342, -1.720905, -2.181733, 0.2901961, 1, 0, 1,
-0.5564871, -0.09508391, 0.2208364, 0.282353, 1, 0, 1,
-0.5514936, 1.373332, -1.174044, 0.2784314, 1, 0, 1,
-0.5513012, -0.1869646, -1.210849, 0.2705882, 1, 0, 1,
-0.5484022, 0.5820846, -1.077623, 0.2666667, 1, 0, 1,
-0.5481035, 0.6096039, -2.120063, 0.2588235, 1, 0, 1,
-0.5467619, -0.3593695, -1.030711, 0.254902, 1, 0, 1,
-0.5374537, -0.349128, -3.77142, 0.2470588, 1, 0, 1,
-0.5364641, 2.016343, -1.679839, 0.2431373, 1, 0, 1,
-0.5353012, -0.3149426, -0.8311528, 0.2352941, 1, 0, 1,
-0.5351798, 0.1798548, 1.027635, 0.2313726, 1, 0, 1,
-0.5334122, -0.5403733, -0.7874821, 0.2235294, 1, 0, 1,
-0.5327335, -1.11668, -2.093858, 0.2196078, 1, 0, 1,
-0.5290655, -0.2175207, -1.512751, 0.2117647, 1, 0, 1,
-0.5282041, -0.05745307, -0.2219112, 0.2078431, 1, 0, 1,
-0.5268782, -1.145315, -1.641072, 0.2, 1, 0, 1,
-0.5186182, -1.336601, -0.8139321, 0.1921569, 1, 0, 1,
-0.5124211, 0.832286, -1.914612, 0.1882353, 1, 0, 1,
-0.5117217, 0.005605875, -1.134523, 0.1803922, 1, 0, 1,
-0.5106918, 0.2965361, 1.177768, 0.1764706, 1, 0, 1,
-0.509482, -1.618757, -3.78307, 0.1686275, 1, 0, 1,
-0.5082679, -1.533312, -1.69617, 0.1647059, 1, 0, 1,
-0.5056087, 0.027876, -2.267702, 0.1568628, 1, 0, 1,
-0.5042493, 0.1074812, -2.129795, 0.1529412, 1, 0, 1,
-0.5024239, 1.880775, 0.4684328, 0.145098, 1, 0, 1,
-0.5020959, 0.2239982, -0.5623751, 0.1411765, 1, 0, 1,
-0.5006544, 1.57171, -0.3470016, 0.1333333, 1, 0, 1,
-0.5005238, -0.2074312, -1.999066, 0.1294118, 1, 0, 1,
-0.498073, -0.6606196, -3.867487, 0.1215686, 1, 0, 1,
-0.4972064, -1.105201, -1.54315, 0.1176471, 1, 0, 1,
-0.4954884, 0.1914893, -1.883921, 0.1098039, 1, 0, 1,
-0.4933909, -0.485322, -2.872404, 0.1058824, 1, 0, 1,
-0.4892234, -1.718344, -2.839751, 0.09803922, 1, 0, 1,
-0.4873716, 0.05911762, -0.7199385, 0.09019608, 1, 0, 1,
-0.4867667, -0.7728587, -3.896801, 0.08627451, 1, 0, 1,
-0.4834109, -0.7039657, -2.450401, 0.07843138, 1, 0, 1,
-0.479367, 0.1809594, -0.9654695, 0.07450981, 1, 0, 1,
-0.473504, 0.01210372, -1.055982, 0.06666667, 1, 0, 1,
-0.4723385, 0.9941201, 1.05563, 0.0627451, 1, 0, 1,
-0.4657889, 1.414962, -1.241119, 0.05490196, 1, 0, 1,
-0.4597585, 0.1900259, -0.1585834, 0.05098039, 1, 0, 1,
-0.4597034, -0.426083, -2.381783, 0.04313726, 1, 0, 1,
-0.4585134, 0.4013892, 0.5423334, 0.03921569, 1, 0, 1,
-0.4583676, 0.008075977, -2.724677, 0.03137255, 1, 0, 1,
-0.4576317, 0.6795812, -0.07529603, 0.02745098, 1, 0, 1,
-0.4510323, -0.6050406, -1.938859, 0.01960784, 1, 0, 1,
-0.4503177, 0.7408634, -0.2105526, 0.01568628, 1, 0, 1,
-0.4484165, -1.614999, -3.23722, 0.007843138, 1, 0, 1,
-0.4429004, 1.738997, -2.049303, 0.003921569, 1, 0, 1,
-0.440245, -0.5874376, -2.726647, 0, 1, 0.003921569, 1,
-0.4389468, 0.891345, 0.2104974, 0, 1, 0.01176471, 1,
-0.4330527, -1.158767, -2.072757, 0, 1, 0.01568628, 1,
-0.431812, -0.8020903, -2.384823, 0, 1, 0.02352941, 1,
-0.4315656, -1.212282, -3.030711, 0, 1, 0.02745098, 1,
-0.4315206, -2.566092, -2.659562, 0, 1, 0.03529412, 1,
-0.4305297, 2.455154, -0.09552981, 0, 1, 0.03921569, 1,
-0.4277645, -1.640086, -3.97072, 0, 1, 0.04705882, 1,
-0.4267801, -0.6633902, -2.668765, 0, 1, 0.05098039, 1,
-0.4251259, -0.3515122, -2.125885, 0, 1, 0.05882353, 1,
-0.417692, -1.17634, -3.161852, 0, 1, 0.0627451, 1,
-0.4166904, -1.422848, -3.400047, 0, 1, 0.07058824, 1,
-0.4160447, 0.8412324, 0.1048235, 0, 1, 0.07450981, 1,
-0.415503, 2.146481, 0.1935932, 0, 1, 0.08235294, 1,
-0.4150022, 0.6809827, -1.014808, 0, 1, 0.08627451, 1,
-0.4101461, 0.1101218, 0.02730874, 0, 1, 0.09411765, 1,
-0.409343, -1.5378, -2.847355, 0, 1, 0.1019608, 1,
-0.4091161, -0.9409524, -2.19576, 0, 1, 0.1058824, 1,
-0.4073132, -1.064096, -2.711138, 0, 1, 0.1137255, 1,
-0.4061557, -0.2296075, -2.187804, 0, 1, 0.1176471, 1,
-0.4050724, -1.676596, -2.186238, 0, 1, 0.1254902, 1,
-0.4048066, 1.265192, -1.239358, 0, 1, 0.1294118, 1,
-0.4038242, -1.070765, -3.239887, 0, 1, 0.1372549, 1,
-0.4004243, 0.1434154, -0.9621106, 0, 1, 0.1411765, 1,
-0.3998843, -0.5623924, -2.323445, 0, 1, 0.1490196, 1,
-0.3951511, 0.5426075, -0.8117797, 0, 1, 0.1529412, 1,
-0.3950857, -0.7413766, -3.059587, 0, 1, 0.1607843, 1,
-0.3895902, -0.9550898, -3.470701, 0, 1, 0.1647059, 1,
-0.3832711, -0.08941326, -2.931725, 0, 1, 0.172549, 1,
-0.3822337, -1.459777, -1.957938, 0, 1, 0.1764706, 1,
-0.373786, -0.631044, -3.646591, 0, 1, 0.1843137, 1,
-0.3737464, 1.644639, -1.411781, 0, 1, 0.1882353, 1,
-0.3687695, 0.5386032, -0.6018354, 0, 1, 0.1960784, 1,
-0.3645358, -0.876569, -3.096593, 0, 1, 0.2039216, 1,
-0.3600878, -1.291339, -1.371412, 0, 1, 0.2078431, 1,
-0.354058, -0.7999434, -2.209621, 0, 1, 0.2156863, 1,
-0.3525044, -0.3351057, -1.052557, 0, 1, 0.2196078, 1,
-0.3522835, -2.068302, -1.707194, 0, 1, 0.227451, 1,
-0.3488422, -0.8245639, -1.020782, 0, 1, 0.2313726, 1,
-0.3484034, 2.638536, -0.5369925, 0, 1, 0.2392157, 1,
-0.3458297, 0.05797307, -2.785463, 0, 1, 0.2431373, 1,
-0.3442928, -0.4425524, -1.395483, 0, 1, 0.2509804, 1,
-0.3405987, -0.1586498, -1.251246, 0, 1, 0.254902, 1,
-0.340136, -1.559043, -2.106508, 0, 1, 0.2627451, 1,
-0.3400318, 0.2246018, -2.975402, 0, 1, 0.2666667, 1,
-0.33353, 0.2389927, -1.253452, 0, 1, 0.2745098, 1,
-0.3320465, 0.01926668, -1.663072, 0, 1, 0.2784314, 1,
-0.3320317, 0.4173699, 1.255938, 0, 1, 0.2862745, 1,
-0.3301732, -0.3336096, -3.913237, 0, 1, 0.2901961, 1,
-0.3283489, -0.4939316, -1.416378, 0, 1, 0.2980392, 1,
-0.3236251, -1.083674, -1.456372, 0, 1, 0.3058824, 1,
-0.3214053, 0.57885, -1.285304, 0, 1, 0.3098039, 1,
-0.3162687, 0.1655287, -0.4959763, 0, 1, 0.3176471, 1,
-0.3155357, 0.08693532, -1.137856, 0, 1, 0.3215686, 1,
-0.3126462, 0.3343548, 0.606517, 0, 1, 0.3294118, 1,
-0.3123358, 0.6864662, -0.1917777, 0, 1, 0.3333333, 1,
-0.3109595, 1.3845, 0.8023776, 0, 1, 0.3411765, 1,
-0.3100037, -0.10754, -1.974017, 0, 1, 0.345098, 1,
-0.3075399, -0.5107878, -3.192277, 0, 1, 0.3529412, 1,
-0.3038868, -1.291601, -3.755859, 0, 1, 0.3568628, 1,
-0.3022274, -1.357521, -2.671951, 0, 1, 0.3647059, 1,
-0.3018453, -0.9466375, -2.656789, 0, 1, 0.3686275, 1,
-0.2985003, 0.5891249, 1.525807, 0, 1, 0.3764706, 1,
-0.2974498, -0.4187627, -2.540382, 0, 1, 0.3803922, 1,
-0.2970715, 0.6835923, 1.787451, 0, 1, 0.3882353, 1,
-0.2874149, -0.1735504, -2.389755, 0, 1, 0.3921569, 1,
-0.2862388, -0.1688001, -3.01204, 0, 1, 0.4, 1,
-0.2838951, -0.5257725, -2.590351, 0, 1, 0.4078431, 1,
-0.2801723, -0.376771, -1.536972, 0, 1, 0.4117647, 1,
-0.2788574, -0.4914937, -1.332904, 0, 1, 0.4196078, 1,
-0.2781431, -0.6958723, -3.789274, 0, 1, 0.4235294, 1,
-0.2765058, 0.4382303, -0.5202471, 0, 1, 0.4313726, 1,
-0.2753208, -0.3434038, -2.41286, 0, 1, 0.4352941, 1,
-0.2698764, 0.8624471, -1.526933, 0, 1, 0.4431373, 1,
-0.2678092, -2.166772, -2.443868, 0, 1, 0.4470588, 1,
-0.2672096, -0.6897056, -5.221197, 0, 1, 0.454902, 1,
-0.2667869, 1.081515, 1.022023, 0, 1, 0.4588235, 1,
-0.2582106, -1.191179, -3.717587, 0, 1, 0.4666667, 1,
-0.2550446, -0.7021374, -4.456852, 0, 1, 0.4705882, 1,
-0.2513492, 0.00747079, -1.562702, 0, 1, 0.4784314, 1,
-0.2509049, 1.469971, -0.04376351, 0, 1, 0.4823529, 1,
-0.2487311, -0.2622574, -3.035829, 0, 1, 0.4901961, 1,
-0.2330051, -1.26197, -0.756101, 0, 1, 0.4941176, 1,
-0.2267155, 0.1168381, 0.7202332, 0, 1, 0.5019608, 1,
-0.2134543, -0.04029451, -3.35475, 0, 1, 0.509804, 1,
-0.2133085, 0.3777906, -1.83716, 0, 1, 0.5137255, 1,
-0.2132429, 0.729418, -0.7893852, 0, 1, 0.5215687, 1,
-0.2089293, -1.797047, -4.938879, 0, 1, 0.5254902, 1,
-0.2085395, 0.4209136, -0.3639153, 0, 1, 0.5333334, 1,
-0.2067436, 0.1443205, -1.248083, 0, 1, 0.5372549, 1,
-0.20649, -0.5441378, -2.767716, 0, 1, 0.5450981, 1,
-0.1958418, -1.131162, -1.080391, 0, 1, 0.5490196, 1,
-0.1902619, -0.1806934, -3.418477, 0, 1, 0.5568628, 1,
-0.189145, 0.3493175, -0.6912985, 0, 1, 0.5607843, 1,
-0.1888231, 0.7550132, -0.3365343, 0, 1, 0.5686275, 1,
-0.1887606, -0.2247369, -2.578373, 0, 1, 0.572549, 1,
-0.1857074, 0.3077616, -0.5962092, 0, 1, 0.5803922, 1,
-0.1835464, -0.3895529, -1.804816, 0, 1, 0.5843138, 1,
-0.1787176, 1.143949, -0.4184799, 0, 1, 0.5921569, 1,
-0.1778273, 0.4208705, -0.4936564, 0, 1, 0.5960785, 1,
-0.1674477, -0.7643477, -2.562425, 0, 1, 0.6039216, 1,
-0.166593, -1.086769, -2.224521, 0, 1, 0.6117647, 1,
-0.1659572, -1.391547, -1.644938, 0, 1, 0.6156863, 1,
-0.1579188, -0.417686, -2.936591, 0, 1, 0.6235294, 1,
-0.1574809, -1.696416, -4.455015, 0, 1, 0.627451, 1,
-0.1553131, 0.2538961, -0.4023038, 0, 1, 0.6352941, 1,
-0.1521894, 0.04701543, -1.664637, 0, 1, 0.6392157, 1,
-0.1515941, -2.10548, -3.395949, 0, 1, 0.6470588, 1,
-0.1442828, -0.3356901, -3.846963, 0, 1, 0.6509804, 1,
-0.1442498, 0.7140607, 0.4205559, 0, 1, 0.6588235, 1,
-0.1437576, -0.3954498, -3.7421, 0, 1, 0.6627451, 1,
-0.1406167, -0.3763586, -2.498768, 0, 1, 0.6705883, 1,
-0.138906, -0.03754608, -1.986465, 0, 1, 0.6745098, 1,
-0.1357583, 0.7447917, 0.44214, 0, 1, 0.682353, 1,
-0.1336277, -1.067015, -3.139028, 0, 1, 0.6862745, 1,
-0.1320976, -0.007351737, -0.176898, 0, 1, 0.6941177, 1,
-0.1320971, -0.5188807, -3.029211, 0, 1, 0.7019608, 1,
-0.1273128, 0.8052488, 1.766493, 0, 1, 0.7058824, 1,
-0.1204629, -0.1270062, -1.005246, 0, 1, 0.7137255, 1,
-0.1192072, -1.485283, -5.83744, 0, 1, 0.7176471, 1,
-0.1190991, 0.05524746, -0.90957, 0, 1, 0.7254902, 1,
-0.1163491, 1.070894, 1.131065, 0, 1, 0.7294118, 1,
-0.1140228, -1.200489, -4.402183, 0, 1, 0.7372549, 1,
-0.1123639, -0.5401075, -1.88075, 0, 1, 0.7411765, 1,
-0.1108947, -1.594703, -3.851653, 0, 1, 0.7490196, 1,
-0.1093063, 0.09633516, -1.459212, 0, 1, 0.7529412, 1,
-0.1086463, 0.1084775, -0.6724889, 0, 1, 0.7607843, 1,
-0.1065864, 1.968073, -0.9421462, 0, 1, 0.7647059, 1,
-0.1064564, 0.7432566, 0.5080743, 0, 1, 0.772549, 1,
-0.1039436, 0.4860736, 0.3256242, 0, 1, 0.7764706, 1,
-0.1022429, 0.5737499, 1.121571, 0, 1, 0.7843137, 1,
-0.1013367, -0.8819129, -2.382021, 0, 1, 0.7882353, 1,
-0.09774787, -1.330634, -3.141333, 0, 1, 0.7960784, 1,
-0.09652015, -0.2175908, -3.23507, 0, 1, 0.8039216, 1,
-0.09203678, 0.8527704, 1.081035, 0, 1, 0.8078431, 1,
-0.0816846, 1.208212, 1.070286, 0, 1, 0.8156863, 1,
-0.08097265, 1.298794, -0.9706154, 0, 1, 0.8196079, 1,
-0.07919891, 0.8874042, 0.2043649, 0, 1, 0.827451, 1,
-0.07791183, 0.402488, -1.045855, 0, 1, 0.8313726, 1,
-0.07611733, 0.007072815, -1.136101, 0, 1, 0.8392157, 1,
-0.07165828, -1.295604, -2.903433, 0, 1, 0.8431373, 1,
-0.07121687, 1.066752, -0.4879591, 0, 1, 0.8509804, 1,
-0.07099877, -0.01413779, -2.040107, 0, 1, 0.854902, 1,
-0.07075203, 1.985775, 0.1559544, 0, 1, 0.8627451, 1,
-0.06839375, 0.7671835, -0.4998705, 0, 1, 0.8666667, 1,
-0.06666238, 0.3520492, -0.4942439, 0, 1, 0.8745098, 1,
-0.06601459, 0.7527383, 2.201187, 0, 1, 0.8784314, 1,
-0.06600799, 0.1857824, 1.126199, 0, 1, 0.8862745, 1,
-0.06155003, 0.9122163, 0.7494377, 0, 1, 0.8901961, 1,
-0.06122568, -0.01515302, -1.896715, 0, 1, 0.8980392, 1,
-0.05930449, 0.178669, -0.400175, 0, 1, 0.9058824, 1,
-0.05681071, -0.03696532, -0.7350646, 0, 1, 0.9098039, 1,
-0.05520241, 0.8056112, -0.7453052, 0, 1, 0.9176471, 1,
-0.05443827, 0.1418003, -1.381966, 0, 1, 0.9215686, 1,
-0.05327972, 1.307389, 1.006533, 0, 1, 0.9294118, 1,
-0.0530669, 0.5678331, 1.324237, 0, 1, 0.9333333, 1,
-0.04845611, 0.3181659, 1.383339, 0, 1, 0.9411765, 1,
-0.04642201, -1.387643, -5.160879, 0, 1, 0.945098, 1,
-0.04500273, 0.9555215, -1.673712, 0, 1, 0.9529412, 1,
-0.04486869, -1.524054, -2.449166, 0, 1, 0.9568627, 1,
-0.04365786, 1.136821, -0.928588, 0, 1, 0.9647059, 1,
-0.03973305, -2.696467, -3.713207, 0, 1, 0.9686275, 1,
-0.03947574, -0.929148, -3.222648, 0, 1, 0.9764706, 1,
-0.03912807, -0.7880102, -3.427976, 0, 1, 0.9803922, 1,
-0.03868007, -0.6674957, -3.099934, 0, 1, 0.9882353, 1,
-0.03307843, -0.3469428, -2.067014, 0, 1, 0.9921569, 1,
-0.0324631, -0.01110794, -0.4380838, 0, 1, 1, 1,
-0.03190064, 0.293914, 1.144485, 0, 0.9921569, 1, 1,
-0.03032028, -0.3694752, -2.828045, 0, 0.9882353, 1, 1,
-0.02925378, -1.943931, -2.941356, 0, 0.9803922, 1, 1,
-0.027718, 0.3632212, -0.9964139, 0, 0.9764706, 1, 1,
-0.02736527, -0.9715785, 0.7294131, 0, 0.9686275, 1, 1,
-0.02539455, -1.728821, -2.266126, 0, 0.9647059, 1, 1,
-0.02537833, 0.4958677, -0.8254457, 0, 0.9568627, 1, 1,
-0.02481039, 0.1397126, 0.3506587, 0, 0.9529412, 1, 1,
-0.02476756, -1.362268, -3.100106, 0, 0.945098, 1, 1,
-0.02399875, -0.136308, -2.085073, 0, 0.9411765, 1, 1,
-0.02364555, 0.8834091, 1.255412, 0, 0.9333333, 1, 1,
-0.02103492, -0.7303271, -3.348313, 0, 0.9294118, 1, 1,
-0.01427988, -1.055049, -2.234748, 0, 0.9215686, 1, 1,
-0.003532764, 0.127067, -0.7737058, 0, 0.9176471, 1, 1,
-0.001109389, -0.5276327, -2.413722, 0, 0.9098039, 1, 1,
0.001240592, 1.01867, 1.325602, 0, 0.9058824, 1, 1,
0.004077899, 0.1113825, 0.2736051, 0, 0.8980392, 1, 1,
0.006113927, -0.6363441, 2.953904, 0, 0.8901961, 1, 1,
0.01175541, -0.8757827, 3.20031, 0, 0.8862745, 1, 1,
0.0166445, 0.5315925, 1.273358, 0, 0.8784314, 1, 1,
0.02141366, 1.628782, -1.11535, 0, 0.8745098, 1, 1,
0.02602214, -2.161831, 3.489631, 0, 0.8666667, 1, 1,
0.03745, -0.2122257, 1.538418, 0, 0.8627451, 1, 1,
0.03755181, -1.004693, 4.1189, 0, 0.854902, 1, 1,
0.04315454, 0.7036074, 1.473896, 0, 0.8509804, 1, 1,
0.04499686, -1.190886, 2.040846, 0, 0.8431373, 1, 1,
0.04678457, 0.4202998, -1.211985, 0, 0.8392157, 1, 1,
0.04894305, 0.1852612, 0.7375705, 0, 0.8313726, 1, 1,
0.05043657, -0.4622822, 2.635214, 0, 0.827451, 1, 1,
0.05331979, -1.032479, 1.614791, 0, 0.8196079, 1, 1,
0.05445937, 0.6482095, -0.9184726, 0, 0.8156863, 1, 1,
0.05611762, -1.577118, 5.703, 0, 0.8078431, 1, 1,
0.05721203, 0.5315039, 0.1754283, 0, 0.8039216, 1, 1,
0.0597414, -0.6577745, 2.346835, 0, 0.7960784, 1, 1,
0.06169897, -0.6500123, 3.282637, 0, 0.7882353, 1, 1,
0.06255753, -0.6318064, 4.13519, 0, 0.7843137, 1, 1,
0.07024289, 0.3108133, 0.5518171, 0, 0.7764706, 1, 1,
0.07316216, 0.4564998, 0.8530616, 0, 0.772549, 1, 1,
0.07648525, -0.1031271, 2.295424, 0, 0.7647059, 1, 1,
0.07720781, -0.452686, 3.486473, 0, 0.7607843, 1, 1,
0.07779578, -1.193011, 2.668984, 0, 0.7529412, 1, 1,
0.07921843, -0.4180093, 2.699316, 0, 0.7490196, 1, 1,
0.08105467, -1.217181, 2.467916, 0, 0.7411765, 1, 1,
0.08142284, -0.09297914, 2.942098, 0, 0.7372549, 1, 1,
0.08386902, 0.1784614, 1.330219, 0, 0.7294118, 1, 1,
0.08422807, 0.2962707, 0.9885623, 0, 0.7254902, 1, 1,
0.08430138, -0.0278997, 4.768909, 0, 0.7176471, 1, 1,
0.08853168, -1.717108, 2.197011, 0, 0.7137255, 1, 1,
0.09296167, -0.4506024, 1.960625, 0, 0.7058824, 1, 1,
0.1021345, 1.127485, -0.5271763, 0, 0.6980392, 1, 1,
0.1097009, 0.2771053, -0.8866379, 0, 0.6941177, 1, 1,
0.109876, -0.7823142, 2.345318, 0, 0.6862745, 1, 1,
0.1108202, -0.4791352, 2.755554, 0, 0.682353, 1, 1,
0.1146236, 0.0258995, 3.120575, 0, 0.6745098, 1, 1,
0.1157784, 0.7930248, 0.7695646, 0, 0.6705883, 1, 1,
0.1187093, -1.965272, 3.98385, 0, 0.6627451, 1, 1,
0.119683, 0.02644444, 1.862689, 0, 0.6588235, 1, 1,
0.1230549, 1.600057, 0.5912409, 0, 0.6509804, 1, 1,
0.1325264, 0.5248492, 2.088752, 0, 0.6470588, 1, 1,
0.1403518, -1.103135, 3.516554, 0, 0.6392157, 1, 1,
0.1420945, 1.227842, -0.9245059, 0, 0.6352941, 1, 1,
0.1421492, 1.002049, 0.6605982, 0, 0.627451, 1, 1,
0.1439319, -1.176403, 2.380024, 0, 0.6235294, 1, 1,
0.1481384, -0.9848472, 3.185129, 0, 0.6156863, 1, 1,
0.1482056, 0.4187633, 0.6903586, 0, 0.6117647, 1, 1,
0.1517122, 0.7533479, -0.1928701, 0, 0.6039216, 1, 1,
0.152383, 0.7827429, -0.1019941, 0, 0.5960785, 1, 1,
0.1525002, 0.5386076, 0.3688737, 0, 0.5921569, 1, 1,
0.1553827, 1.160254, 2.963485, 0, 0.5843138, 1, 1,
0.1568093, -1.294074, 3.57478, 0, 0.5803922, 1, 1,
0.158061, 0.2772122, -0.3914031, 0, 0.572549, 1, 1,
0.1585058, -2.390323, 1.843381, 0, 0.5686275, 1, 1,
0.1612284, -0.5928845, 3.472421, 0, 0.5607843, 1, 1,
0.1662916, 0.1441768, 0.1929746, 0, 0.5568628, 1, 1,
0.1695971, 0.8514632, 0.2217826, 0, 0.5490196, 1, 1,
0.1733141, -1.000372, 2.050801, 0, 0.5450981, 1, 1,
0.1775968, -1.970916, 3.825365, 0, 0.5372549, 1, 1,
0.1849202, -1.398201, 3.643597, 0, 0.5333334, 1, 1,
0.1870196, -0.02734971, 2.184813, 0, 0.5254902, 1, 1,
0.1886934, 0.2741006, 1.571775, 0, 0.5215687, 1, 1,
0.1907337, 2.505436, 0.6442272, 0, 0.5137255, 1, 1,
0.1911181, -0.8156027, 2.539283, 0, 0.509804, 1, 1,
0.1920122, -0.01269044, -0.1392684, 0, 0.5019608, 1, 1,
0.1921683, 1.685373, 0.5644662, 0, 0.4941176, 1, 1,
0.192398, -0.1199421, 1.133096, 0, 0.4901961, 1, 1,
0.1927129, -0.5092314, 2.185808, 0, 0.4823529, 1, 1,
0.1973121, 1.500859, 0.8415923, 0, 0.4784314, 1, 1,
0.1995319, -0.2029313, 2.467778, 0, 0.4705882, 1, 1,
0.2028262, -1.416113, 1.922465, 0, 0.4666667, 1, 1,
0.2038541, 0.5165585, 0.06352375, 0, 0.4588235, 1, 1,
0.205541, 1.614931, 0.06440386, 0, 0.454902, 1, 1,
0.2059334, 1.39616, -2.133469, 0, 0.4470588, 1, 1,
0.2092974, 0.04710692, 1.727413, 0, 0.4431373, 1, 1,
0.2149669, 1.390401, 1.624026, 0, 0.4352941, 1, 1,
0.220798, 0.07821715, 1.884697, 0, 0.4313726, 1, 1,
0.2227506, 0.8939158, 0.009807845, 0, 0.4235294, 1, 1,
0.22511, 0.3342817, 1.97169, 0, 0.4196078, 1, 1,
0.2261549, 0.06904713, 2.170832, 0, 0.4117647, 1, 1,
0.2310781, 0.496398, 0.3675243, 0, 0.4078431, 1, 1,
0.2324683, -0.9723468, 4.388965, 0, 0.4, 1, 1,
0.2327142, 0.9205577, 0.7934659, 0, 0.3921569, 1, 1,
0.2342124, -0.3999492, 3.515772, 0, 0.3882353, 1, 1,
0.2357134, 0.2762692, 1.414793, 0, 0.3803922, 1, 1,
0.2384941, -0.6729749, 3.870676, 0, 0.3764706, 1, 1,
0.2407831, -0.4141621, 1.240418, 0, 0.3686275, 1, 1,
0.2461307, -0.8606958, 2.444342, 0, 0.3647059, 1, 1,
0.247436, -0.7274088, 2.06601, 0, 0.3568628, 1, 1,
0.2483241, -0.9099391, 2.802284, 0, 0.3529412, 1, 1,
0.2496548, 1.179512, 0.07451811, 0, 0.345098, 1, 1,
0.2515523, 0.08913623, 2.416643, 0, 0.3411765, 1, 1,
0.2562651, 2.347248, 1.946337, 0, 0.3333333, 1, 1,
0.2595405, 0.7146531, 0.9386499, 0, 0.3294118, 1, 1,
0.2599252, -0.08238694, 1.630413, 0, 0.3215686, 1, 1,
0.2606836, -0.2313258, 2.832026, 0, 0.3176471, 1, 1,
0.2678311, -0.1620354, 0.9357612, 0, 0.3098039, 1, 1,
0.2718724, 0.349653, 1.939764, 0, 0.3058824, 1, 1,
0.272944, -0.1233051, 2.560891, 0, 0.2980392, 1, 1,
0.2761455, -0.1284071, 0.2741244, 0, 0.2901961, 1, 1,
0.2771918, -1.493967, 1.851678, 0, 0.2862745, 1, 1,
0.2883271, -0.5718243, 1.741861, 0, 0.2784314, 1, 1,
0.2889158, 0.2143605, 1.788839, 0, 0.2745098, 1, 1,
0.2894391, -0.2904674, 1.481119, 0, 0.2666667, 1, 1,
0.2928182, 1.274465, 0.2612424, 0, 0.2627451, 1, 1,
0.2969472, -0.5231456, 2.561811, 0, 0.254902, 1, 1,
0.2978899, 0.4778093, 0.9709852, 0, 0.2509804, 1, 1,
0.304048, 0.3095616, -0.2811213, 0, 0.2431373, 1, 1,
0.3050847, -0.4279172, 3.730665, 0, 0.2392157, 1, 1,
0.3054742, -0.8407668, 3.716046, 0, 0.2313726, 1, 1,
0.3067827, -0.5678466, 1.360428, 0, 0.227451, 1, 1,
0.3089175, -1.00538, 0.5128924, 0, 0.2196078, 1, 1,
0.3116904, 1.635286, -1.556769, 0, 0.2156863, 1, 1,
0.3127169, -1.148205, 4.487715, 0, 0.2078431, 1, 1,
0.3204726, -0.3792932, 2.307732, 0, 0.2039216, 1, 1,
0.3218712, 0.8208868, 0.4446205, 0, 0.1960784, 1, 1,
0.3321025, -0.4113061, 2.08919, 0, 0.1882353, 1, 1,
0.3336929, 0.4854796, 1.705274, 0, 0.1843137, 1, 1,
0.3354829, -1.480707, 4.255075, 0, 0.1764706, 1, 1,
0.3356814, -0.1343696, 2.264728, 0, 0.172549, 1, 1,
0.3362736, 1.802467, 0.5868104, 0, 0.1647059, 1, 1,
0.3397867, -1.041608, 2.104097, 0, 0.1607843, 1, 1,
0.3433411, 2.336241, 1.840452, 0, 0.1529412, 1, 1,
0.3456131, -0.3310959, 1.744195, 0, 0.1490196, 1, 1,
0.3477484, 0.8927664, 0.7420205, 0, 0.1411765, 1, 1,
0.3491945, 0.8234274, -1.024793, 0, 0.1372549, 1, 1,
0.3513806, 0.4384566, -0.754255, 0, 0.1294118, 1, 1,
0.3547467, 2.591488, 0.5209381, 0, 0.1254902, 1, 1,
0.3562658, 1.5669, 0.8129858, 0, 0.1176471, 1, 1,
0.3600287, -0.5204141, 2.411159, 0, 0.1137255, 1, 1,
0.3604784, -0.7522067, 2.572157, 0, 0.1058824, 1, 1,
0.3618562, -0.1766159, 2.504652, 0, 0.09803922, 1, 1,
0.3701614, 0.5233066, 2.832105, 0, 0.09411765, 1, 1,
0.3719877, 1.534846, 0.7191779, 0, 0.08627451, 1, 1,
0.3729483, 1.461939, -1.204936, 0, 0.08235294, 1, 1,
0.3747809, -0.5251589, 2.157237, 0, 0.07450981, 1, 1,
0.375541, -0.8459136, 3.40953, 0, 0.07058824, 1, 1,
0.3764578, -0.5574566, 1.905721, 0, 0.0627451, 1, 1,
0.3781698, 0.4951025, 1.274572, 0, 0.05882353, 1, 1,
0.3802924, 1.070964, 0.2447714, 0, 0.05098039, 1, 1,
0.3845197, 1.574518, 1.718841, 0, 0.04705882, 1, 1,
0.3859695, 1.128267, 0.2582084, 0, 0.03921569, 1, 1,
0.390361, 0.5813306, 0.9107799, 0, 0.03529412, 1, 1,
0.3973794, 1.095471, 0.8980539, 0, 0.02745098, 1, 1,
0.4014311, -0.7048811, 1.883143, 0, 0.02352941, 1, 1,
0.4014705, 0.5513135, 0.6812363, 0, 0.01568628, 1, 1,
0.4061407, -0.7809301, 1.224545, 0, 0.01176471, 1, 1,
0.4088446, -0.8232667, 2.076117, 0, 0.003921569, 1, 1,
0.4124124, 0.2677015, 1.535799, 0.003921569, 0, 1, 1,
0.4126425, -1.013318, 3.033801, 0.007843138, 0, 1, 1,
0.4220131, 0.8043859, 0.4573687, 0.01568628, 0, 1, 1,
0.4220884, 0.2339142, 0.5043551, 0.01960784, 0, 1, 1,
0.425562, 0.371573, 0.009102557, 0.02745098, 0, 1, 1,
0.4290247, -0.04604484, 1.500368, 0.03137255, 0, 1, 1,
0.4297429, -0.323306, 2.043583, 0.03921569, 0, 1, 1,
0.4310424, -0.8090235, 1.382792, 0.04313726, 0, 1, 1,
0.4374276, -0.5769241, 2.388975, 0.05098039, 0, 1, 1,
0.4388493, 0.4733765, -0.2375816, 0.05490196, 0, 1, 1,
0.44188, -0.1085909, 0.9274105, 0.0627451, 0, 1, 1,
0.4424278, -1.545267, 3.557383, 0.06666667, 0, 1, 1,
0.4434778, -0.05354597, 1.291775, 0.07450981, 0, 1, 1,
0.4440477, -0.3433714, 1.261515, 0.07843138, 0, 1, 1,
0.4445977, -0.2077004, 2.748761, 0.08627451, 0, 1, 1,
0.4453781, -0.3422073, 1.685006, 0.09019608, 0, 1, 1,
0.4470017, 1.343073, -0.6735212, 0.09803922, 0, 1, 1,
0.4535315, -2.074642, 2.130364, 0.1058824, 0, 1, 1,
0.4566138, -0.5778308, 3.160718, 0.1098039, 0, 1, 1,
0.4566659, -1.473512, 3.209593, 0.1176471, 0, 1, 1,
0.4648676, 0.7676243, -0.7606038, 0.1215686, 0, 1, 1,
0.4656311, 0.7329648, -0.2658384, 0.1294118, 0, 1, 1,
0.4659389, 0.5835386, 0.3130963, 0.1333333, 0, 1, 1,
0.4704526, 0.1246886, 2.056395, 0.1411765, 0, 1, 1,
0.4718339, 0.1851511, 2.796779, 0.145098, 0, 1, 1,
0.4760154, -1.524449, 3.791909, 0.1529412, 0, 1, 1,
0.4851728, -0.0001187439, 1.921, 0.1568628, 0, 1, 1,
0.4874009, 1.413858, -0.7087685, 0.1647059, 0, 1, 1,
0.4874343, -1.087457, 2.065592, 0.1686275, 0, 1, 1,
0.489151, -1.320312, 4.255691, 0.1764706, 0, 1, 1,
0.4906733, -0.3818463, 3.596138, 0.1803922, 0, 1, 1,
0.4924222, 0.1775883, 0.2615449, 0.1882353, 0, 1, 1,
0.4969231, 0.1319833, 2.166237, 0.1921569, 0, 1, 1,
0.4973368, 1.064439, 0.6715579, 0.2, 0, 1, 1,
0.4976604, 1.691709, 0.1037673, 0.2078431, 0, 1, 1,
0.5003363, -1.437853, 2.177151, 0.2117647, 0, 1, 1,
0.5092885, -0.3939442, 2.063762, 0.2196078, 0, 1, 1,
0.5095423, -0.6837016, 0.826074, 0.2235294, 0, 1, 1,
0.511775, 0.3176762, 2.25, 0.2313726, 0, 1, 1,
0.5159593, -0.8511654, 2.919448, 0.2352941, 0, 1, 1,
0.5174578, 0.9016625, -0.6759666, 0.2431373, 0, 1, 1,
0.5175799, -0.09714013, 0.9818811, 0.2470588, 0, 1, 1,
0.5184512, -0.963555, 1.771762, 0.254902, 0, 1, 1,
0.5207534, 0.3204593, 0.147227, 0.2588235, 0, 1, 1,
0.5217842, -0.04371185, 0.9860534, 0.2666667, 0, 1, 1,
0.5270866, -0.2325099, 2.079926, 0.2705882, 0, 1, 1,
0.5293571, -0.4215291, 1.445137, 0.2784314, 0, 1, 1,
0.532757, -1.011414, 2.097983, 0.282353, 0, 1, 1,
0.5334139, -0.5723183, 3.113955, 0.2901961, 0, 1, 1,
0.5361705, 1.11856, -0.5607571, 0.2941177, 0, 1, 1,
0.5372474, -0.01349428, 0.8739653, 0.3019608, 0, 1, 1,
0.5381037, 0.2834409, 1.190196, 0.3098039, 0, 1, 1,
0.5466353, -0.1471936, 2.362909, 0.3137255, 0, 1, 1,
0.5498756, 0.2710987, 1.251302, 0.3215686, 0, 1, 1,
0.5537657, -1.504397, 3.475049, 0.3254902, 0, 1, 1,
0.5594416, -2.188925, 1.9193, 0.3333333, 0, 1, 1,
0.561842, 0.3488961, 0.6781421, 0.3372549, 0, 1, 1,
0.5619204, -1.381196, 2.383168, 0.345098, 0, 1, 1,
0.5624836, -1.222018, 3.342245, 0.3490196, 0, 1, 1,
0.562711, -0.6048077, 2.87795, 0.3568628, 0, 1, 1,
0.5681962, 0.4429815, 3.227133, 0.3607843, 0, 1, 1,
0.5723527, -0.7045034, 0.5312276, 0.3686275, 0, 1, 1,
0.5735305, -0.7819405, 2.942154, 0.372549, 0, 1, 1,
0.5738475, 0.3989929, 1.542361, 0.3803922, 0, 1, 1,
0.5755585, 1.138147, 0.5238574, 0.3843137, 0, 1, 1,
0.5843618, 0.2878463, 1.462231, 0.3921569, 0, 1, 1,
0.5852296, -0.0420464, 2.647745, 0.3960784, 0, 1, 1,
0.5884327, 0.7709925, 0.7990267, 0.4039216, 0, 1, 1,
0.6021101, -1.198666, 2.991278, 0.4117647, 0, 1, 1,
0.603898, 0.7998719, 1.474344, 0.4156863, 0, 1, 1,
0.604739, -0.952115, 3.138918, 0.4235294, 0, 1, 1,
0.6074717, 0.2241969, -1.205117, 0.427451, 0, 1, 1,
0.6083462, -0.4744327, 4.676673, 0.4352941, 0, 1, 1,
0.6122348, -0.2082799, 1.813564, 0.4392157, 0, 1, 1,
0.6240479, -0.2237981, 1.58121, 0.4470588, 0, 1, 1,
0.6332887, -0.1246108, 0.5074863, 0.4509804, 0, 1, 1,
0.6339832, 2.246773, 1.568887, 0.4588235, 0, 1, 1,
0.635295, 0.3230285, 2.566066, 0.4627451, 0, 1, 1,
0.636426, -0.6981077, 3.614526, 0.4705882, 0, 1, 1,
0.6414306, -0.760174, 2.302802, 0.4745098, 0, 1, 1,
0.6418115, -0.03347521, -0.311913, 0.4823529, 0, 1, 1,
0.6424443, -1.344334, 2.954995, 0.4862745, 0, 1, 1,
0.6453218, 0.3932663, 0.5204062, 0.4941176, 0, 1, 1,
0.6466416, 1.27263, -0.8506864, 0.5019608, 0, 1, 1,
0.6486947, 0.20095, 1.813241, 0.5058824, 0, 1, 1,
0.6513705, 0.07507106, 2.032838, 0.5137255, 0, 1, 1,
0.6537731, -0.2417718, 2.42758, 0.5176471, 0, 1, 1,
0.6540777, 1.414271, 0.3671849, 0.5254902, 0, 1, 1,
0.6552171, -0.4628224, 2.880034, 0.5294118, 0, 1, 1,
0.6553398, -0.487081, 0.9157282, 0.5372549, 0, 1, 1,
0.6555678, 0.7388185, 1.413147, 0.5411765, 0, 1, 1,
0.6570922, -1.111958, 4.038888, 0.5490196, 0, 1, 1,
0.6575217, 0.1805675, 1.205883, 0.5529412, 0, 1, 1,
0.6579539, -0.1628341, 1.240495, 0.5607843, 0, 1, 1,
0.6586967, -1.277912, 3.965, 0.5647059, 0, 1, 1,
0.6642337, 0.2835646, -0.01111861, 0.572549, 0, 1, 1,
0.6643542, 0.6141955, 1.892051, 0.5764706, 0, 1, 1,
0.6656902, -0.5469459, 5.034526, 0.5843138, 0, 1, 1,
0.6665028, -1.201071, 2.691065, 0.5882353, 0, 1, 1,
0.6784141, 1.226547, 1.668266, 0.5960785, 0, 1, 1,
0.6789164, 1.126129, 0.4156404, 0.6039216, 0, 1, 1,
0.6805652, -1.208276, 1.892032, 0.6078432, 0, 1, 1,
0.6830727, -1.49461, 3.827628, 0.6156863, 0, 1, 1,
0.6833501, 0.1503254, 0.7506377, 0.6196079, 0, 1, 1,
0.6838278, 0.07929388, 0.6544167, 0.627451, 0, 1, 1,
0.6852496, 0.3097861, 0.8058868, 0.6313726, 0, 1, 1,
0.6943307, -0.756899, 2.147686, 0.6392157, 0, 1, 1,
0.6967608, 1.74835, -0.2392526, 0.6431373, 0, 1, 1,
0.7032623, -0.7662714, 0.9718237, 0.6509804, 0, 1, 1,
0.7036734, -0.7495199, 2.70287, 0.654902, 0, 1, 1,
0.7060084, -0.2033651, 1.211376, 0.6627451, 0, 1, 1,
0.7080217, -1.38485, 4.044837, 0.6666667, 0, 1, 1,
0.7094587, -0.05504225, -0.01157108, 0.6745098, 0, 1, 1,
0.7166332, 1.123483, 0.6987296, 0.6784314, 0, 1, 1,
0.7202822, 0.4575677, 1.0498, 0.6862745, 0, 1, 1,
0.7213688, 0.5542848, 1.679134, 0.6901961, 0, 1, 1,
0.7219371, -1.045638, 1.733425, 0.6980392, 0, 1, 1,
0.7278357, 0.3803214, 2.614071, 0.7058824, 0, 1, 1,
0.7296303, -1.123356, 1.789401, 0.7098039, 0, 1, 1,
0.7324827, 0.9731922, 1.190155, 0.7176471, 0, 1, 1,
0.7360365, 0.1352561, 1.319978, 0.7215686, 0, 1, 1,
0.7362017, -1.201605, 2.982622, 0.7294118, 0, 1, 1,
0.7406061, -0.05624289, 1.813949, 0.7333333, 0, 1, 1,
0.7470206, -0.9741423, 3.519897, 0.7411765, 0, 1, 1,
0.7572941, 1.377176, -1.484675, 0.7450981, 0, 1, 1,
0.7636361, 1.221575, 2.332824, 0.7529412, 0, 1, 1,
0.7800412, 0.4739843, -0.5105305, 0.7568628, 0, 1, 1,
0.7807863, 0.4537362, 1.909834, 0.7647059, 0, 1, 1,
0.781367, -1.894305, 1.297912, 0.7686275, 0, 1, 1,
0.7913643, 0.09781525, 1.384875, 0.7764706, 0, 1, 1,
0.7942025, -0.04859687, 3.085713, 0.7803922, 0, 1, 1,
0.7955868, 1.661279, -0.1835023, 0.7882353, 0, 1, 1,
0.7978286, -0.7480736, 2.765892, 0.7921569, 0, 1, 1,
0.7986625, 1.262369, 0.04404552, 0.8, 0, 1, 1,
0.8007982, -0.007208504, 2.638235, 0.8078431, 0, 1, 1,
0.8148443, -2.313651, 2.685994, 0.8117647, 0, 1, 1,
0.8155071, 0.5542212, 1.024147, 0.8196079, 0, 1, 1,
0.8253356, 0.1335152, 1.666489, 0.8235294, 0, 1, 1,
0.8261106, 2.299343, -0.2524968, 0.8313726, 0, 1, 1,
0.8272036, 0.4884159, 0.02223915, 0.8352941, 0, 1, 1,
0.8274173, -0.6121178, 2.772978, 0.8431373, 0, 1, 1,
0.8356097, -0.362168, 3.644421, 0.8470588, 0, 1, 1,
0.840991, -1.415933, 2.107364, 0.854902, 0, 1, 1,
0.8468829, -2.916562, 2.325282, 0.8588235, 0, 1, 1,
0.8470521, -1.754516, 1.163678, 0.8666667, 0, 1, 1,
0.8475488, -0.1561064, 2.796041, 0.8705882, 0, 1, 1,
0.8499193, 0.2108414, 1.669565, 0.8784314, 0, 1, 1,
0.8511147, -0.2472894, 0.959411, 0.8823529, 0, 1, 1,
0.8604913, -1.185549, 2.484485, 0.8901961, 0, 1, 1,
0.8626168, -0.2517205, 0.2739902, 0.8941177, 0, 1, 1,
0.8638549, -0.6020406, 3.378156, 0.9019608, 0, 1, 1,
0.8670396, -0.3903912, 1.758443, 0.9098039, 0, 1, 1,
0.8676208, -0.4356534, 0.4660711, 0.9137255, 0, 1, 1,
0.8735843, -0.2228413, 1.819273, 0.9215686, 0, 1, 1,
0.8756192, -1.517893, 0.2286493, 0.9254902, 0, 1, 1,
0.8771291, -0.1654571, 0.9399323, 0.9333333, 0, 1, 1,
0.8848057, 1.244856, -0.4316309, 0.9372549, 0, 1, 1,
0.8888417, 0.1357722, 1.545592, 0.945098, 0, 1, 1,
0.8944761, 2.286588, 0.02556082, 0.9490196, 0, 1, 1,
0.9016122, -0.4448182, 1.492929, 0.9568627, 0, 1, 1,
0.9048229, -3.257927, 3.985366, 0.9607843, 0, 1, 1,
0.9078884, -0.5312762, 2.84804, 0.9686275, 0, 1, 1,
0.9088966, -0.4497738, 3.382584, 0.972549, 0, 1, 1,
0.91074, 0.4361802, 0.2588721, 0.9803922, 0, 1, 1,
0.9137741, 1.361113, 0.2421194, 0.9843137, 0, 1, 1,
0.9216821, 0.1529508, 0.2278524, 0.9921569, 0, 1, 1,
0.9297143, -0.2101562, 3.239325, 0.9960784, 0, 1, 1,
0.9335642, 1.01208, 0.7909783, 1, 0, 0.9960784, 1,
0.9396176, 0.1911279, 0.4949034, 1, 0, 0.9882353, 1,
0.9399267, 0.3868812, 0.09928825, 1, 0, 0.9843137, 1,
0.9443877, -0.8344035, 3.075831, 1, 0, 0.9764706, 1,
0.9524832, -0.0332587, -0.207314, 1, 0, 0.972549, 1,
0.9525719, 1.89032, 1.629467, 1, 0, 0.9647059, 1,
0.957496, 0.06045165, 2.034234, 1, 0, 0.9607843, 1,
0.9578509, 0.2776499, 2.938341, 1, 0, 0.9529412, 1,
0.9605074, 0.1379843, 2.441615, 1, 0, 0.9490196, 1,
0.9707134, -0.07635652, 0.8173859, 1, 0, 0.9411765, 1,
0.9726159, -0.164773, 0.9113758, 1, 0, 0.9372549, 1,
0.9783161, 0.6974462, 0.8416472, 1, 0, 0.9294118, 1,
0.9799783, -0.2289341, 2.250709, 1, 0, 0.9254902, 1,
0.9813207, 0.8391229, 2.49075, 1, 0, 0.9176471, 1,
0.9834051, -0.07603923, 0.2950986, 1, 0, 0.9137255, 1,
0.9892285, 0.3754445, -0.01888806, 1, 0, 0.9058824, 1,
0.9916294, -0.2991602, 1.788351, 1, 0, 0.9019608, 1,
0.9954497, -0.628141, 1.654778, 1, 0, 0.8941177, 1,
1.009225, 0.3515159, 1.158497, 1, 0, 0.8862745, 1,
1.015322, 1.315932, 1.756512, 1, 0, 0.8823529, 1,
1.016494, 0.8053869, -0.1613328, 1, 0, 0.8745098, 1,
1.022993, -0.6111631, 2.337029, 1, 0, 0.8705882, 1,
1.024625, 0.3315751, 1.285318, 1, 0, 0.8627451, 1,
1.026178, 1.261819, 1.648866, 1, 0, 0.8588235, 1,
1.027268, -0.3171246, 1.640072, 1, 0, 0.8509804, 1,
1.030903, 0.02055818, 1.731931, 1, 0, 0.8470588, 1,
1.050046, 0.6808195, 2.640595, 1, 0, 0.8392157, 1,
1.053635, 1.098979, 0.184052, 1, 0, 0.8352941, 1,
1.0587, -0.9130632, 0.8183087, 1, 0, 0.827451, 1,
1.061287, 1.245134, 0.7979175, 1, 0, 0.8235294, 1,
1.06132, 0.9998981, 0.15214, 1, 0, 0.8156863, 1,
1.062125, 0.376265, -0.6604447, 1, 0, 0.8117647, 1,
1.067911, -0.03650011, 0.282654, 1, 0, 0.8039216, 1,
1.069763, 0.3181173, 0.3125172, 1, 0, 0.7960784, 1,
1.072822, 0.3834904, -0.9287902, 1, 0, 0.7921569, 1,
1.080244, -1.100817, 1.291566, 1, 0, 0.7843137, 1,
1.085674, 0.6781452, 1.030921, 1, 0, 0.7803922, 1,
1.096234, 0.2219449, 1.691602, 1, 0, 0.772549, 1,
1.098119, 1.494953, 0.7123584, 1, 0, 0.7686275, 1,
1.112043, -0.7327225, 1.586616, 1, 0, 0.7607843, 1,
1.116818, -0.785406, 3.315194, 1, 0, 0.7568628, 1,
1.124343, 0.8992317, -0.154545, 1, 0, 0.7490196, 1,
1.128606, 1.845163, 0.8188972, 1, 0, 0.7450981, 1,
1.129167, 0.4130664, 1.195312, 1, 0, 0.7372549, 1,
1.137054, 0.6121883, 2.092139, 1, 0, 0.7333333, 1,
1.138346, -0.02601931, -0.03426278, 1, 0, 0.7254902, 1,
1.140048, 0.5237395, 0.4854162, 1, 0, 0.7215686, 1,
1.146552, 0.6452148, 0.698548, 1, 0, 0.7137255, 1,
1.153048, -0.7149286, 2.447178, 1, 0, 0.7098039, 1,
1.155552, -0.9260232, 1.423334, 1, 0, 0.7019608, 1,
1.162938, 0.2411275, 1.102528, 1, 0, 0.6941177, 1,
1.169773, -1.48958, 1.594917, 1, 0, 0.6901961, 1,
1.171696, 0.4504099, 2.061079, 1, 0, 0.682353, 1,
1.17278, -1.149095, 1.785833, 1, 0, 0.6784314, 1,
1.175033, -0.7147575, 2.242246, 1, 0, 0.6705883, 1,
1.185389, -0.3155206, 1.961339, 1, 0, 0.6666667, 1,
1.190429, 0.20993, 0.02150981, 1, 0, 0.6588235, 1,
1.193234, 0.4703383, 1.555296, 1, 0, 0.654902, 1,
1.196878, 0.5628339, 0.2147175, 1, 0, 0.6470588, 1,
1.19854, -0.4722234, 1.641665, 1, 0, 0.6431373, 1,
1.205567, 1.205662, -0.8548678, 1, 0, 0.6352941, 1,
1.208478, 0.3954383, -0.6312332, 1, 0, 0.6313726, 1,
1.214046, 1.15188, 3.38059, 1, 0, 0.6235294, 1,
1.232756, 0.5137849, 1.904099, 1, 0, 0.6196079, 1,
1.239258, -0.07142165, 0.8994226, 1, 0, 0.6117647, 1,
1.248996, 0.2945499, 0.07416283, 1, 0, 0.6078432, 1,
1.252466, 0.3678407, 0.755266, 1, 0, 0.6, 1,
1.256362, 0.9950647, 1.227072, 1, 0, 0.5921569, 1,
1.261079, -1.976103, 4.132241, 1, 0, 0.5882353, 1,
1.264675, -0.6205147, 0.8092325, 1, 0, 0.5803922, 1,
1.274639, 1.830188, 1.493644, 1, 0, 0.5764706, 1,
1.280143, -0.2380229, 3.040649, 1, 0, 0.5686275, 1,
1.291165, 1.58738, 1.527644, 1, 0, 0.5647059, 1,
1.30064, -0.5431535, 1.96031, 1, 0, 0.5568628, 1,
1.302068, -0.2890788, 1.031358, 1, 0, 0.5529412, 1,
1.312183, -0.3562095, 1.858747, 1, 0, 0.5450981, 1,
1.315211, -2.464074, 0.3497667, 1, 0, 0.5411765, 1,
1.316914, -0.528146, 3.484971, 1, 0, 0.5333334, 1,
1.319424, -1.732831, 1.589971, 1, 0, 0.5294118, 1,
1.320456, -0.492099, 3.102167, 1, 0, 0.5215687, 1,
1.320533, 0.3047056, 0.8753319, 1, 0, 0.5176471, 1,
1.323114, -0.5208393, 2.521259, 1, 0, 0.509804, 1,
1.323327, 0.1771971, 1.321392, 1, 0, 0.5058824, 1,
1.33025, 0.9794188, -0.02082254, 1, 0, 0.4980392, 1,
1.343486, -0.7230006, 2.602204, 1, 0, 0.4901961, 1,
1.345895, -0.3278853, -0.09059903, 1, 0, 0.4862745, 1,
1.359986, 0.7514609, 1.43003, 1, 0, 0.4784314, 1,
1.36029, -0.8359769, 1.694036, 1, 0, 0.4745098, 1,
1.367879, 0.3494096, 1.822713, 1, 0, 0.4666667, 1,
1.386197, 0.8312099, 1.455428, 1, 0, 0.4627451, 1,
1.405619, -0.3727653, 2.458445, 1, 0, 0.454902, 1,
1.41008, 0.8898686, 1.173973, 1, 0, 0.4509804, 1,
1.414194, 1.316516, 2.043485, 1, 0, 0.4431373, 1,
1.417695, 0.5648167, 0.4042368, 1, 0, 0.4392157, 1,
1.441235, -0.6195807, 0.336482, 1, 0, 0.4313726, 1,
1.442499, -1.153398, 3.972518, 1, 0, 0.427451, 1,
1.448738, 1.218998, 0.4809208, 1, 0, 0.4196078, 1,
1.455641, 0.3209977, 3.26566, 1, 0, 0.4156863, 1,
1.468974, -1.0131, 2.524089, 1, 0, 0.4078431, 1,
1.470359, 0.5481341, 0.9054958, 1, 0, 0.4039216, 1,
1.4824, 0.3879799, 1.406083, 1, 0, 0.3960784, 1,
1.504076, -0.9166706, 1.566241, 1, 0, 0.3882353, 1,
1.506436, -1.278043, 3.886371, 1, 0, 0.3843137, 1,
1.534877, -0.3506683, 2.328737, 1, 0, 0.3764706, 1,
1.536478, -0.5399778, 0.702334, 1, 0, 0.372549, 1,
1.557461, -2.203628, 3.02827, 1, 0, 0.3647059, 1,
1.559138, -0.4577847, 1.098052, 1, 0, 0.3607843, 1,
1.575839, 0.9704992, 2.772719, 1, 0, 0.3529412, 1,
1.605765, -1.370015, 0.979655, 1, 0, 0.3490196, 1,
1.619452, 0.4447594, 2.239509, 1, 0, 0.3411765, 1,
1.621744, 0.7092294, 0.8761907, 1, 0, 0.3372549, 1,
1.621883, -0.2952656, 0.7792671, 1, 0, 0.3294118, 1,
1.629835, 0.6676349, 1.580692, 1, 0, 0.3254902, 1,
1.632558, -0.5077709, 2.078123, 1, 0, 0.3176471, 1,
1.634135, 0.8451303, 2.177869, 1, 0, 0.3137255, 1,
1.65024, -0.1335709, 1.968143, 1, 0, 0.3058824, 1,
1.652341, -0.02805608, 1.766022, 1, 0, 0.2980392, 1,
1.652677, -0.01273972, 1.116336, 1, 0, 0.2941177, 1,
1.675799, -0.4483592, 1.224683, 1, 0, 0.2862745, 1,
1.68045, -0.04902001, -0.6129988, 1, 0, 0.282353, 1,
1.683678, 0.5631266, 0.4794379, 1, 0, 0.2745098, 1,
1.689644, 0.566637, 1.506818, 1, 0, 0.2705882, 1,
1.713234, 0.7875461, 0.4611248, 1, 0, 0.2627451, 1,
1.719094, -0.5758801, 1.206981, 1, 0, 0.2588235, 1,
1.753957, -1.517686, 2.386292, 1, 0, 0.2509804, 1,
1.764614, 0.06902561, 2.973711, 1, 0, 0.2470588, 1,
1.77136, 0.4754593, 2.650776, 1, 0, 0.2392157, 1,
1.777464, -0.211797, 4.600715, 1, 0, 0.2352941, 1,
1.780281, 0.5233613, 3.444763, 1, 0, 0.227451, 1,
1.782427, -1.029745, 2.579388, 1, 0, 0.2235294, 1,
1.784084, 0.4737718, 1.09006, 1, 0, 0.2156863, 1,
1.80365, -0.5376103, 2.68905, 1, 0, 0.2117647, 1,
1.809725, -0.06867176, 1.59567, 1, 0, 0.2039216, 1,
1.824334, -0.4019837, 1.197865, 1, 0, 0.1960784, 1,
1.833294, 1.01598, 2.507308, 1, 0, 0.1921569, 1,
1.835026, -0.02249819, 3.399231, 1, 0, 0.1843137, 1,
1.89565, -0.9994966, 0.9272732, 1, 0, 0.1803922, 1,
1.904784, -1.195296, 2.179204, 1, 0, 0.172549, 1,
1.944386, -1.417684, 2.952322, 1, 0, 0.1686275, 1,
1.95073, 0.3399104, 2.405544, 1, 0, 0.1607843, 1,
1.952513, 2.285279, 0.3858571, 1, 0, 0.1568628, 1,
1.956459, 1.122403, 0.9011662, 1, 0, 0.1490196, 1,
1.96947, 1.056557, 1.236806, 1, 0, 0.145098, 1,
1.97803, 1.673932, 1.061877, 1, 0, 0.1372549, 1,
1.978266, 1.449182, -0.0895487, 1, 0, 0.1333333, 1,
1.986094, -0.2277808, 1.135828, 1, 0, 0.1254902, 1,
2.038919, 1.3688, 3.054289, 1, 0, 0.1215686, 1,
2.039195, 1.063427, 1.583001, 1, 0, 0.1137255, 1,
2.060535, 2.697062, 2.714769, 1, 0, 0.1098039, 1,
2.095028, 1.329828, 1.622713, 1, 0, 0.1019608, 1,
2.110085, 0.5264017, 0.5092533, 1, 0, 0.09411765, 1,
2.115197, 0.4612476, 2.341389, 1, 0, 0.09019608, 1,
2.181299, 1.491862, 1.335868, 1, 0, 0.08235294, 1,
2.195158, -0.2212474, 1.40424, 1, 0, 0.07843138, 1,
2.282049, -0.2914346, 2.99149, 1, 0, 0.07058824, 1,
2.305526, -0.2959453, 0.109779, 1, 0, 0.06666667, 1,
2.346922, -0.4953564, 0.7075821, 1, 0, 0.05882353, 1,
2.511761, 0.186938, 2.563056, 1, 0, 0.05490196, 1,
2.538971, 1.096847, 0.7869929, 1, 0, 0.04705882, 1,
2.673924, -0.3587911, 3.441509, 1, 0, 0.04313726, 1,
2.753901, 0.9317064, 0.09111562, 1, 0, 0.03529412, 1,
3.150797, 1.085675, -0.1654177, 1, 0, 0.03137255, 1,
3.228746, 0.1592581, 0.5434748, 1, 0, 0.02352941, 1,
3.711229, -1.127063, 3.8337, 1, 0, 0.01960784, 1,
3.71862, -0.6170726, 2.285767, 1, 0, 0.01176471, 1,
4.094697, 1.21953, 3.160306, 1, 0, 0.007843138, 1
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
0.6830899, -4.280019, -7.793545, 0, -0.5, 0.5, 0.5,
0.6830899, -4.280019, -7.793545, 1, -0.5, 0.5, 0.5,
0.6830899, -4.280019, -7.793545, 1, 1.5, 0.5, 0.5,
0.6830899, -4.280019, -7.793545, 0, 1.5, 0.5, 0.5
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
-3.885053, -0.2429073, -7.793545, 0, -0.5, 0.5, 0.5,
-3.885053, -0.2429073, -7.793545, 1, -0.5, 0.5, 0.5,
-3.885053, -0.2429073, -7.793545, 1, 1.5, 0.5, 0.5,
-3.885053, -0.2429073, -7.793545, 0, 1.5, 0.5, 0.5
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
-3.885053, -4.280019, -0.06721997, 0, -0.5, 0.5, 0.5,
-3.885053, -4.280019, -0.06721997, 1, -0.5, 0.5, 0.5,
-3.885053, -4.280019, -0.06721997, 1, 1.5, 0.5, 0.5,
-3.885053, -4.280019, -0.06721997, 0, 1.5, 0.5, 0.5
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
-2, -3.348378, -6.010547,
4, -3.348378, -6.010547,
-2, -3.348378, -6.010547,
-2, -3.503651, -6.307713,
-1, -3.348378, -6.010547,
-1, -3.503651, -6.307713,
0, -3.348378, -6.010547,
0, -3.503651, -6.307713,
1, -3.348378, -6.010547,
1, -3.503651, -6.307713,
2, -3.348378, -6.010547,
2, -3.503651, -6.307713,
3, -3.348378, -6.010547,
3, -3.503651, -6.307713,
4, -3.348378, -6.010547,
4, -3.503651, -6.307713
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
"3",
"4"
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
-2, -3.814198, -6.902046, 0, -0.5, 0.5, 0.5,
-2, -3.814198, -6.902046, 1, -0.5, 0.5, 0.5,
-2, -3.814198, -6.902046, 1, 1.5, 0.5, 0.5,
-2, -3.814198, -6.902046, 0, 1.5, 0.5, 0.5,
-1, -3.814198, -6.902046, 0, -0.5, 0.5, 0.5,
-1, -3.814198, -6.902046, 1, -0.5, 0.5, 0.5,
-1, -3.814198, -6.902046, 1, 1.5, 0.5, 0.5,
-1, -3.814198, -6.902046, 0, 1.5, 0.5, 0.5,
0, -3.814198, -6.902046, 0, -0.5, 0.5, 0.5,
0, -3.814198, -6.902046, 1, -0.5, 0.5, 0.5,
0, -3.814198, -6.902046, 1, 1.5, 0.5, 0.5,
0, -3.814198, -6.902046, 0, 1.5, 0.5, 0.5,
1, -3.814198, -6.902046, 0, -0.5, 0.5, 0.5,
1, -3.814198, -6.902046, 1, -0.5, 0.5, 0.5,
1, -3.814198, -6.902046, 1, 1.5, 0.5, 0.5,
1, -3.814198, -6.902046, 0, 1.5, 0.5, 0.5,
2, -3.814198, -6.902046, 0, -0.5, 0.5, 0.5,
2, -3.814198, -6.902046, 1, -0.5, 0.5, 0.5,
2, -3.814198, -6.902046, 1, 1.5, 0.5, 0.5,
2, -3.814198, -6.902046, 0, 1.5, 0.5, 0.5,
3, -3.814198, -6.902046, 0, -0.5, 0.5, 0.5,
3, -3.814198, -6.902046, 1, -0.5, 0.5, 0.5,
3, -3.814198, -6.902046, 1, 1.5, 0.5, 0.5,
3, -3.814198, -6.902046, 0, 1.5, 0.5, 0.5,
4, -3.814198, -6.902046, 0, -0.5, 0.5, 0.5,
4, -3.814198, -6.902046, 1, -0.5, 0.5, 0.5,
4, -3.814198, -6.902046, 1, 1.5, 0.5, 0.5,
4, -3.814198, -6.902046, 0, 1.5, 0.5, 0.5
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
-2.830866, -3, -6.010547,
-2.830866, 2, -6.010547,
-2.830866, -3, -6.010547,
-3.006564, -3, -6.307713,
-2.830866, -2, -6.010547,
-3.006564, -2, -6.307713,
-2.830866, -1, -6.010547,
-3.006564, -1, -6.307713,
-2.830866, 0, -6.010547,
-3.006564, 0, -6.307713,
-2.830866, 1, -6.010547,
-3.006564, 1, -6.307713,
-2.830866, 2, -6.010547,
-3.006564, 2, -6.307713
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
-3.357959, -3, -6.902046, 0, -0.5, 0.5, 0.5,
-3.357959, -3, -6.902046, 1, -0.5, 0.5, 0.5,
-3.357959, -3, -6.902046, 1, 1.5, 0.5, 0.5,
-3.357959, -3, -6.902046, 0, 1.5, 0.5, 0.5,
-3.357959, -2, -6.902046, 0, -0.5, 0.5, 0.5,
-3.357959, -2, -6.902046, 1, -0.5, 0.5, 0.5,
-3.357959, -2, -6.902046, 1, 1.5, 0.5, 0.5,
-3.357959, -2, -6.902046, 0, 1.5, 0.5, 0.5,
-3.357959, -1, -6.902046, 0, -0.5, 0.5, 0.5,
-3.357959, -1, -6.902046, 1, -0.5, 0.5, 0.5,
-3.357959, -1, -6.902046, 1, 1.5, 0.5, 0.5,
-3.357959, -1, -6.902046, 0, 1.5, 0.5, 0.5,
-3.357959, 0, -6.902046, 0, -0.5, 0.5, 0.5,
-3.357959, 0, -6.902046, 1, -0.5, 0.5, 0.5,
-3.357959, 0, -6.902046, 1, 1.5, 0.5, 0.5,
-3.357959, 0, -6.902046, 0, 1.5, 0.5, 0.5,
-3.357959, 1, -6.902046, 0, -0.5, 0.5, 0.5,
-3.357959, 1, -6.902046, 1, -0.5, 0.5, 0.5,
-3.357959, 1, -6.902046, 1, 1.5, 0.5, 0.5,
-3.357959, 1, -6.902046, 0, 1.5, 0.5, 0.5,
-3.357959, 2, -6.902046, 0, -0.5, 0.5, 0.5,
-3.357959, 2, -6.902046, 1, -0.5, 0.5, 0.5,
-3.357959, 2, -6.902046, 1, 1.5, 0.5, 0.5,
-3.357959, 2, -6.902046, 0, 1.5, 0.5, 0.5
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
-2.830866, -3.348378, -4,
-2.830866, -3.348378, 4,
-2.830866, -3.348378, -4,
-3.006564, -3.503651, -4,
-2.830866, -3.348378, -2,
-3.006564, -3.503651, -2,
-2.830866, -3.348378, 0,
-3.006564, -3.503651, 0,
-2.830866, -3.348378, 2,
-3.006564, -3.503651, 2,
-2.830866, -3.348378, 4,
-3.006564, -3.503651, 4
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
-3.357959, -3.814198, -4, 0, -0.5, 0.5, 0.5,
-3.357959, -3.814198, -4, 1, -0.5, 0.5, 0.5,
-3.357959, -3.814198, -4, 1, 1.5, 0.5, 0.5,
-3.357959, -3.814198, -4, 0, 1.5, 0.5, 0.5,
-3.357959, -3.814198, -2, 0, -0.5, 0.5, 0.5,
-3.357959, -3.814198, -2, 1, -0.5, 0.5, 0.5,
-3.357959, -3.814198, -2, 1, 1.5, 0.5, 0.5,
-3.357959, -3.814198, -2, 0, 1.5, 0.5, 0.5,
-3.357959, -3.814198, 0, 0, -0.5, 0.5, 0.5,
-3.357959, -3.814198, 0, 1, -0.5, 0.5, 0.5,
-3.357959, -3.814198, 0, 1, 1.5, 0.5, 0.5,
-3.357959, -3.814198, 0, 0, 1.5, 0.5, 0.5,
-3.357959, -3.814198, 2, 0, -0.5, 0.5, 0.5,
-3.357959, -3.814198, 2, 1, -0.5, 0.5, 0.5,
-3.357959, -3.814198, 2, 1, 1.5, 0.5, 0.5,
-3.357959, -3.814198, 2, 0, 1.5, 0.5, 0.5,
-3.357959, -3.814198, 4, 0, -0.5, 0.5, 0.5,
-3.357959, -3.814198, 4, 1, -0.5, 0.5, 0.5,
-3.357959, -3.814198, 4, 1, 1.5, 0.5, 0.5,
-3.357959, -3.814198, 4, 0, 1.5, 0.5, 0.5
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
-2.830866, -3.348378, -6.010547,
-2.830866, 2.862563, -6.010547,
-2.830866, -3.348378, 5.876107,
-2.830866, 2.862563, 5.876107,
-2.830866, -3.348378, -6.010547,
-2.830866, -3.348378, 5.876107,
-2.830866, 2.862563, -6.010547,
-2.830866, 2.862563, 5.876107,
-2.830866, -3.348378, -6.010547,
4.197046, -3.348378, -6.010547,
-2.830866, -3.348378, 5.876107,
4.197046, -3.348378, 5.876107,
-2.830866, 2.862563, -6.010547,
4.197046, 2.862563, -6.010547,
-2.830866, 2.862563, 5.876107,
4.197046, 2.862563, 5.876107,
4.197046, -3.348378, -6.010547,
4.197046, 2.862563, -6.010547,
4.197046, -3.348378, 5.876107,
4.197046, 2.862563, 5.876107,
4.197046, -3.348378, -6.010547,
4.197046, -3.348378, 5.876107,
4.197046, 2.862563, -6.010547,
4.197046, 2.862563, 5.876107
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
var radius = 8.085176;
var distance = 35.97186;
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
mvMatrix.translate( -0.6830899, 0.2429073, 0.06721997 );
mvMatrix.scale( 1.243876, 1.407492, 0.7354341 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.97186);
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
thiophene-2-carboxyl<-read.table("thiophene-2-carboxyl.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-thiophene-2-carboxyl$V2
```

```
## Error in eval(expr, envir, enclos): object 'thiophene' not found
```

```r
y<-thiophene-2-carboxyl$V3
```

```
## Error in eval(expr, envir, enclos): object 'thiophene' not found
```

```r
z<-thiophene-2-carboxyl$V4
```

```
## Error in eval(expr, envir, enclos): object 'thiophene' not found
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
-2.728518, -0.2582527, -2.790969, 0, 0, 1, 1, 1,
-2.703352, 0.9270924, -2.120945, 1, 0, 0, 1, 1,
-2.511862, -0.4442551, -1.663693, 1, 0, 0, 1, 1,
-2.504552, 0.1567397, -2.586267, 1, 0, 0, 1, 1,
-2.5021, -0.900313, -1.706909, 1, 0, 0, 1, 1,
-2.449628, 1.722193, -0.5843928, 1, 0, 0, 1, 1,
-2.363002, -0.7104377, -0.7445426, 0, 0, 0, 1, 1,
-2.35754, -1.737833, -2.720436, 0, 0, 0, 1, 1,
-2.344217, 0.215158, -1.821524, 0, 0, 0, 1, 1,
-2.341149, 0.4547393, -0.1800584, 0, 0, 0, 1, 1,
-2.3305, 1.413361, -1.415354, 0, 0, 0, 1, 1,
-2.249027, -0.5376883, -0.7657727, 0, 0, 0, 1, 1,
-2.16628, -0.0560492, -0.5140646, 0, 0, 0, 1, 1,
-2.095575, -0.7098534, -1.548774, 1, 1, 1, 1, 1,
-2.083121, 0.1606017, -0.6271439, 1, 1, 1, 1, 1,
-2.079318, 0.8762901, -1.609142, 1, 1, 1, 1, 1,
-2.078528, -1.256569, -3.566981, 1, 1, 1, 1, 1,
-2.00446, -0.9716377, -2.5712, 1, 1, 1, 1, 1,
-1.978566, 0.699271, -1.812828, 1, 1, 1, 1, 1,
-1.972121, 1.183636, -0.503467, 1, 1, 1, 1, 1,
-1.932923, -0.5874039, -2.705182, 1, 1, 1, 1, 1,
-1.875952, -0.05894646, -0.521471, 1, 1, 1, 1, 1,
-1.863629, 0.9460536, -0.2747258, 1, 1, 1, 1, 1,
-1.846433, -0.8000517, -2.277094, 1, 1, 1, 1, 1,
-1.8339, 0.2142054, -3.676365, 1, 1, 1, 1, 1,
-1.829878, 0.7777049, -0.736335, 1, 1, 1, 1, 1,
-1.829306, -0.2210161, -2.610536, 1, 1, 1, 1, 1,
-1.805633, -0.985265, -2.640544, 1, 1, 1, 1, 1,
-1.800577, 1.143871, -0.8772463, 0, 0, 1, 1, 1,
-1.769861, -0.3316616, -0.6135573, 1, 0, 0, 1, 1,
-1.750758, 0.5609437, -1.840118, 1, 0, 0, 1, 1,
-1.738401, 0.3745292, -1.348338, 1, 0, 0, 1, 1,
-1.734084, 0.5585495, -0.4915234, 1, 0, 0, 1, 1,
-1.723959, 2.126167, 0.5214214, 1, 0, 0, 1, 1,
-1.715213, 1.933286, -2.132783, 0, 0, 0, 1, 1,
-1.682531, 0.7720402, -0.9719684, 0, 0, 0, 1, 1,
-1.65506, -0.3223068, -0.6383289, 0, 0, 0, 1, 1,
-1.644933, -1.572293, -1.31156, 0, 0, 0, 1, 1,
-1.641937, -0.1239085, -1.529894, 0, 0, 0, 1, 1,
-1.634933, 0.2755574, -2.420671, 0, 0, 0, 1, 1,
-1.634343, 0.2147385, -1.997099, 0, 0, 0, 1, 1,
-1.631694, 0.5815939, -1.992248, 1, 1, 1, 1, 1,
-1.60641, 0.7635914, -2.193399, 1, 1, 1, 1, 1,
-1.599127, -0.05225886, -3.605845, 1, 1, 1, 1, 1,
-1.595335, -0.008859616, -2.73215, 1, 1, 1, 1, 1,
-1.583495, -0.6530685, -0.6933594, 1, 1, 1, 1, 1,
-1.582819, -0.4331018, -1.993769, 1, 1, 1, 1, 1,
-1.549617, -0.5877389, -0.3166729, 1, 1, 1, 1, 1,
-1.539233, 1.018441, -0.1591639, 1, 1, 1, 1, 1,
-1.538198, 0.4073209, -1.818751, 1, 1, 1, 1, 1,
-1.526712, -1.909757, -3.429873, 1, 1, 1, 1, 1,
-1.514877, 0.1203266, -1.719098, 1, 1, 1, 1, 1,
-1.511118, 0.4248787, -0.8438144, 1, 1, 1, 1, 1,
-1.510365, -0.4601919, -1.159325, 1, 1, 1, 1, 1,
-1.499829, -0.7027763, -1.626045, 1, 1, 1, 1, 1,
-1.484947, 0.09642359, -2.565631, 1, 1, 1, 1, 1,
-1.458372, 1.055935, 1.181339, 0, 0, 1, 1, 1,
-1.447245, 1.979607, -1.234935, 1, 0, 0, 1, 1,
-1.445751, -1.471368, -2.395961, 1, 0, 0, 1, 1,
-1.438326, -0.5107173, -1.539117, 1, 0, 0, 1, 1,
-1.427059, -1.376812, -2.603167, 1, 0, 0, 1, 1,
-1.424836, 0.1081396, -2.976475, 1, 0, 0, 1, 1,
-1.423512, -0.7381095, -2.801531, 0, 0, 0, 1, 1,
-1.421111, 0.6731799, -0.2281788, 0, 0, 0, 1, 1,
-1.411536, 0.3150751, -0.01178939, 0, 0, 0, 1, 1,
-1.379028, -3.033514, -4.229273, 0, 0, 0, 1, 1,
-1.370779, -0.4981021, -1.439419, 0, 0, 0, 1, 1,
-1.364651, -0.3085578, -1.903346, 0, 0, 0, 1, 1,
-1.3639, -1.215127, -1.833313, 0, 0, 0, 1, 1,
-1.360652, -0.7273957, -3.663478, 1, 1, 1, 1, 1,
-1.360173, 0.4428688, -2.072206, 1, 1, 1, 1, 1,
-1.358244, 0.08162243, -2.703861, 1, 1, 1, 1, 1,
-1.347385, -0.5885043, -0.2856665, 1, 1, 1, 1, 1,
-1.344098, 0.6401961, -2.47612, 1, 1, 1, 1, 1,
-1.344071, -1.058826, -4.299627, 1, 1, 1, 1, 1,
-1.340732, 0.1804047, -2.513342, 1, 1, 1, 1, 1,
-1.332311, -1.05115, -1.657532, 1, 1, 1, 1, 1,
-1.329977, 1.800077, 1.550633, 1, 1, 1, 1, 1,
-1.325286, 0.002245885, -1.719113, 1, 1, 1, 1, 1,
-1.32338, -0.7511914, -2.507962, 1, 1, 1, 1, 1,
-1.316535, -0.4158212, -4.093296, 1, 1, 1, 1, 1,
-1.30865, -0.001450733, -0.546571, 1, 1, 1, 1, 1,
-1.304916, 1.594097, -0.9979302, 1, 1, 1, 1, 1,
-1.301682, 0.4389021, -1.998108, 1, 1, 1, 1, 1,
-1.298426, -1.779611, -3.321767, 0, 0, 1, 1, 1,
-1.296963, -1.332234, -1.563882, 1, 0, 0, 1, 1,
-1.29162, 1.019904, -1.718809, 1, 0, 0, 1, 1,
-1.284307, -1.236287, -2.168033, 1, 0, 0, 1, 1,
-1.272796, -0.9457807, -3.288136, 1, 0, 0, 1, 1,
-1.272597, -0.3382892, -1.624611, 1, 0, 0, 1, 1,
-1.263619, -0.6111042, -1.762677, 0, 0, 0, 1, 1,
-1.260413, -0.3133508, -2.104286, 0, 0, 0, 1, 1,
-1.259967, -2.068495, -3.623199, 0, 0, 0, 1, 1,
-1.25987, -0.1915321, -0.5322528, 0, 0, 0, 1, 1,
-1.248088, -0.6431014, -2.555339, 0, 0, 0, 1, 1,
-1.247146, 0.168343, -1.222668, 0, 0, 0, 1, 1,
-1.234477, 1.18564, -0.6230091, 0, 0, 0, 1, 1,
-1.22991, -0.9721856, -2.389404, 1, 1, 1, 1, 1,
-1.227616, 0.1509947, -0.366392, 1, 1, 1, 1, 1,
-1.225343, 0.01745641, -3.041923, 1, 1, 1, 1, 1,
-1.22524, -0.2499834, -2.179978, 1, 1, 1, 1, 1,
-1.209079, -2.482212, -2.416459, 1, 1, 1, 1, 1,
-1.204102, -1.442291, -3.707748, 1, 1, 1, 1, 1,
-1.203915, -0.2349752, -0.1164199, 1, 1, 1, 1, 1,
-1.192269, 1.266369, 0.7712811, 1, 1, 1, 1, 1,
-1.176752, -2.413826, -3.620069, 1, 1, 1, 1, 1,
-1.173388, 2.011228, -0.3340588, 1, 1, 1, 1, 1,
-1.173302, 1.949332, 0.05142385, 1, 1, 1, 1, 1,
-1.16142, -0.4333706, 0.1283944, 1, 1, 1, 1, 1,
-1.157922, -0.1620646, -1.171388, 1, 1, 1, 1, 1,
-1.155625, 1.006961, -0.5715067, 1, 1, 1, 1, 1,
-1.151334, -0.1020492, -2.485498, 1, 1, 1, 1, 1,
-1.147028, -0.6798974, -1.608372, 0, 0, 1, 1, 1,
-1.146692, -0.08161735, -0.08249873, 1, 0, 0, 1, 1,
-1.141667, -1.83194, -2.32133, 1, 0, 0, 1, 1,
-1.13918, -0.1715682, -2.841044, 1, 0, 0, 1, 1,
-1.137834, -0.02120787, -0.9144812, 1, 0, 0, 1, 1,
-1.137204, -0.8164039, -3.166215, 1, 0, 0, 1, 1,
-1.133489, 0.7179933, -1.897681, 0, 0, 0, 1, 1,
-1.131145, -0.2854018, -2.775252, 0, 0, 0, 1, 1,
-1.130946, -0.02200049, -3.412685, 0, 0, 0, 1, 1,
-1.127847, 0.2973011, -0.653653, 0, 0, 0, 1, 1,
-1.124813, -2.112213, -3.657994, 0, 0, 0, 1, 1,
-1.12118, -0.4412104, -3.125467, 0, 0, 0, 1, 1,
-1.11976, 2.228243, 0.1036256, 0, 0, 0, 1, 1,
-1.119549, 0.7296557, -1.858582, 1, 1, 1, 1, 1,
-1.116115, 1.004398, 0.5068157, 1, 1, 1, 1, 1,
-1.111834, -0.09861104, -1.879274, 1, 1, 1, 1, 1,
-1.103092, -0.5771575, -3.240062, 1, 1, 1, 1, 1,
-1.09477, -0.0502668, -2.619213, 1, 1, 1, 1, 1,
-1.093713, -0.2427664, -1.530748, 1, 1, 1, 1, 1,
-1.087577, 1.045953, -0.3354918, 1, 1, 1, 1, 1,
-1.079891, 1.063694, -0.7121853, 1, 1, 1, 1, 1,
-1.079371, -0.4825105, -2.627304, 1, 1, 1, 1, 1,
-1.077297, 0.6082669, -0.6205802, 1, 1, 1, 1, 1,
-1.076722, -0.1649954, -0.9988934, 1, 1, 1, 1, 1,
-1.066503, -1.061808, -1.332517, 1, 1, 1, 1, 1,
-1.065916, 1.974435, -1.064764, 1, 1, 1, 1, 1,
-1.063025, 0.09528505, -2.603123, 1, 1, 1, 1, 1,
-1.060414, 0.7080872, -2.961692, 1, 1, 1, 1, 1,
-1.05753, -2.025962, -2.87442, 0, 0, 1, 1, 1,
-1.057074, 0.6259647, -1.076379, 1, 0, 0, 1, 1,
-1.051409, 0.3066285, -2.669381, 1, 0, 0, 1, 1,
-1.04684, -1.457702, -1.185467, 1, 0, 0, 1, 1,
-1.04282, 0.6952996, 1.310465, 1, 0, 0, 1, 1,
-1.034935, -0.3919114, -0.2695687, 1, 0, 0, 1, 1,
-1.034572, 0.3089566, -1.972928, 0, 0, 0, 1, 1,
-1.034295, 0.4918234, -1.363295, 0, 0, 0, 1, 1,
-1.022714, 1.089352, -0.4620669, 0, 0, 0, 1, 1,
-1.020306, 2.295135, -0.5826856, 0, 0, 0, 1, 1,
-1.019416, 0.04069054, -3.160499, 0, 0, 0, 1, 1,
-1.017746, -2.067703, -4.140769, 0, 0, 0, 1, 1,
-1.014343, 0.8716916, -2.235342, 0, 0, 0, 1, 1,
-1.013362, -1.2302, -2.289127, 1, 1, 1, 1, 1,
-1.005589, -0.1452151, -1.43265, 1, 1, 1, 1, 1,
-1.003283, 0.2738784, -2.975712, 1, 1, 1, 1, 1,
-0.9884029, -0.8141155, -4.004296, 1, 1, 1, 1, 1,
-0.9857455, -0.806299, -2.252832, 1, 1, 1, 1, 1,
-0.9846535, -0.04565633, -0.5987827, 1, 1, 1, 1, 1,
-0.9827645, -0.2857846, -1.683724, 1, 1, 1, 1, 1,
-0.9795246, 1.09889, -0.8504559, 1, 1, 1, 1, 1,
-0.9768042, -1.009305, -0.6763518, 1, 1, 1, 1, 1,
-0.9758846, 0.7958005, -0.02582718, 1, 1, 1, 1, 1,
-0.964779, 0.7791629, 0.270411, 1, 1, 1, 1, 1,
-0.9628457, -0.9263399, -2.123763, 1, 1, 1, 1, 1,
-0.9625557, 1.610464, -0.5520735, 1, 1, 1, 1, 1,
-0.9593144, -0.8344852, -1.317691, 1, 1, 1, 1, 1,
-0.9509149, -0.1630234, -2.450896, 1, 1, 1, 1, 1,
-0.9475778, -1.248084, -2.40415, 0, 0, 1, 1, 1,
-0.9462534, 0.6885992, -0.8164938, 1, 0, 0, 1, 1,
-0.9387487, 0.0667006, -2.49147, 1, 0, 0, 1, 1,
-0.9357994, 2.138642, -0.5887241, 1, 0, 0, 1, 1,
-0.9357738, -1.948624, -1.328812, 1, 0, 0, 1, 1,
-0.9345682, 0.685885, -0.3415551, 1, 0, 0, 1, 1,
-0.9247527, 0.8429426, 1.074757, 0, 0, 0, 1, 1,
-0.9237036, -1.257846, -2.191119, 0, 0, 0, 1, 1,
-0.9159917, 1.414073, -1.411394, 0, 0, 0, 1, 1,
-0.9133672, 1.706824, -0.4156474, 0, 0, 0, 1, 1,
-0.9132611, 0.1001242, 0.426679, 0, 0, 0, 1, 1,
-0.9086555, -0.2171276, -1.612605, 0, 0, 0, 1, 1,
-0.9026942, -0.0318989, -0.8502615, 0, 0, 0, 1, 1,
-0.8956993, 0.3463172, -0.281546, 1, 1, 1, 1, 1,
-0.8887532, 0.6425435, -0.8080732, 1, 1, 1, 1, 1,
-0.8830858, 0.7064548, -2.005004, 1, 1, 1, 1, 1,
-0.8797143, 0.3996023, -2.868386, 1, 1, 1, 1, 1,
-0.8744807, -1.193274, -2.182489, 1, 1, 1, 1, 1,
-0.8703643, -1.55747, -1.16615, 1, 1, 1, 1, 1,
-0.8659083, -0.7103909, -1.507182, 1, 1, 1, 1, 1,
-0.8616203, -2.348882, -1.892934, 1, 1, 1, 1, 1,
-0.860309, -1.028547, -2.483648, 1, 1, 1, 1, 1,
-0.8569307, 0.01565442, -2.537309, 1, 1, 1, 1, 1,
-0.8528006, 0.06343609, -2.189614, 1, 1, 1, 1, 1,
-0.8505949, 0.7925364, -2.688854, 1, 1, 1, 1, 1,
-0.8493807, -1.091302, -1.63793, 1, 1, 1, 1, 1,
-0.8454649, -2.217322, -5.337218, 1, 1, 1, 1, 1,
-0.8453696, -0.3661358, -1.97812, 1, 1, 1, 1, 1,
-0.8395631, 1.167012, -0.1790796, 0, 0, 1, 1, 1,
-0.8382698, -1.144082, -1.985711, 1, 0, 0, 1, 1,
-0.8371166, -1.930241, -2.867119, 1, 0, 0, 1, 1,
-0.83636, -0.5942115, -2.929848, 1, 0, 0, 1, 1,
-0.8352605, -1.978886, -3.302884, 1, 0, 0, 1, 1,
-0.8276065, 0.09634455, -1.492826, 1, 0, 0, 1, 1,
-0.8244185, 1.379506, -0.8911921, 0, 0, 0, 1, 1,
-0.8235555, -0.9130775, -4.073683, 0, 0, 0, 1, 1,
-0.8139961, -2.833396, -2.388723, 0, 0, 0, 1, 1,
-0.7984596, -0.3534385, -1.97223, 0, 0, 0, 1, 1,
-0.7957963, 1.834275, 0.9431523, 0, 0, 0, 1, 1,
-0.7953145, 1.729105, -1.203906, 0, 0, 0, 1, 1,
-0.7950932, -1.30661, -3.254695, 0, 0, 0, 1, 1,
-0.7911265, -0.3051717, -0.5160248, 1, 1, 1, 1, 1,
-0.7907035, 0.3590896, -2.5752, 1, 1, 1, 1, 1,
-0.7891331, 0.1940866, -1.107682, 1, 1, 1, 1, 1,
-0.7862699, -2.484953, -4.178543, 1, 1, 1, 1, 1,
-0.7848571, 0.1443958, -2.448774, 1, 1, 1, 1, 1,
-0.7836413, -0.2726741, -2.021246, 1, 1, 1, 1, 1,
-0.7816454, 0.1010659, -2.009707, 1, 1, 1, 1, 1,
-0.7811424, -0.1233186, -1.014552, 1, 1, 1, 1, 1,
-0.7755781, 2.094524, 1.444659, 1, 1, 1, 1, 1,
-0.7722868, -0.5621302, -0.6050665, 1, 1, 1, 1, 1,
-0.7709823, -1.20307, -1.9221, 1, 1, 1, 1, 1,
-0.7631354, -0.8049787, -3.597916, 1, 1, 1, 1, 1,
-0.7624709, -1.108882, -4.115405, 1, 1, 1, 1, 1,
-0.7587324, -0.761548, -3.159897, 1, 1, 1, 1, 1,
-0.7505163, 0.228776, -1.571707, 1, 1, 1, 1, 1,
-0.7494416, -0.8283249, -1.271093, 0, 0, 1, 1, 1,
-0.7482545, -0.7670467, -2.958664, 1, 0, 0, 1, 1,
-0.7480676, -1.901659, -2.612531, 1, 0, 0, 1, 1,
-0.7460966, 1.319807, -0.267824, 1, 0, 0, 1, 1,
-0.7451911, -1.230084, -2.717567, 1, 0, 0, 1, 1,
-0.7382037, 1.228838, -0.3697784, 1, 0, 0, 1, 1,
-0.7369921, -0.424556, -1.020703, 0, 0, 0, 1, 1,
-0.7355143, -1.331138, -3.725165, 0, 0, 0, 1, 1,
-0.735251, 0.04700487, -1.234205, 0, 0, 0, 1, 1,
-0.7312387, 0.06830987, -0.8612481, 0, 0, 0, 1, 1,
-0.7197996, -0.689181, -2.651844, 0, 0, 0, 1, 1,
-0.7189619, 1.370227, -0.3962087, 0, 0, 0, 1, 1,
-0.7146674, 0.3174684, -2.61859, 0, 0, 0, 1, 1,
-0.712914, 1.956847, 1.328102, 1, 1, 1, 1, 1,
-0.7114332, -0.09169659, 0.3047892, 1, 1, 1, 1, 1,
-0.7113744, 1.053108, -0.5875395, 1, 1, 1, 1, 1,
-0.7064463, -0.7217808, -3.400182, 1, 1, 1, 1, 1,
-0.7062068, 0.09105261, -0.1420429, 1, 1, 1, 1, 1,
-0.7054727, 0.4210252, -2.230774, 1, 1, 1, 1, 1,
-0.7046112, 0.175594, -2.653645, 1, 1, 1, 1, 1,
-0.7033637, -0.05967744, -0.9509915, 1, 1, 1, 1, 1,
-0.7031056, -0.3829099, -1.231663, 1, 1, 1, 1, 1,
-0.7024699, -0.8001652, -1.23542, 1, 1, 1, 1, 1,
-0.6987032, -1.363206, -0.7201438, 1, 1, 1, 1, 1,
-0.6977788, 0.3229539, -2.113335, 1, 1, 1, 1, 1,
-0.6919668, 0.4262889, -0.5127307, 1, 1, 1, 1, 1,
-0.6823902, -0.1707125, -0.2075576, 1, 1, 1, 1, 1,
-0.6797621, 0.4260299, -1.258093, 1, 1, 1, 1, 1,
-0.6795799, -1.407506, -2.738563, 0, 0, 1, 1, 1,
-0.6781421, 0.20946, -0.2471211, 1, 0, 0, 1, 1,
-0.6721888, 0.03241251, -1.073769, 1, 0, 0, 1, 1,
-0.6719257, 2.772113, -0.7257267, 1, 0, 0, 1, 1,
-0.6717749, 0.04945983, 0.4304398, 1, 0, 0, 1, 1,
-0.668628, 0.1336375, 0.09700158, 1, 0, 0, 1, 1,
-0.6663242, -0.471951, -3.081689, 0, 0, 0, 1, 1,
-0.666097, 0.4501534, -2.734488, 0, 0, 0, 1, 1,
-0.6646543, 1.841882, -1.545952, 0, 0, 0, 1, 1,
-0.6547021, 1.002615, -2.116044, 0, 0, 0, 1, 1,
-0.6523785, 1.298779, -1.129286, 0, 0, 0, 1, 1,
-0.6259396, 1.41085, -0.6302487, 0, 0, 0, 1, 1,
-0.6251517, 0.5400882, 1.913811, 0, 0, 0, 1, 1,
-0.6238759, 0.6059066, -1.910815, 1, 1, 1, 1, 1,
-0.6130372, 0.4247674, -2.701358, 1, 1, 1, 1, 1,
-0.6118554, 1.349542, -0.7944062, 1, 1, 1, 1, 1,
-0.6084302, -0.04643101, -1.959422, 1, 1, 1, 1, 1,
-0.6033112, -0.7351695, -2.516687, 1, 1, 1, 1, 1,
-0.6005971, 0.8161908, -0.6367968, 1, 1, 1, 1, 1,
-0.5979331, 1.044367, -0.126339, 1, 1, 1, 1, 1,
-0.5902642, -1.073113, -2.01601, 1, 1, 1, 1, 1,
-0.5892819, 1.394373, -0.2458298, 1, 1, 1, 1, 1,
-0.5808212, -1.618269, -3.695959, 1, 1, 1, 1, 1,
-0.5779408, 0.6262638, -0.8984832, 1, 1, 1, 1, 1,
-0.5759748, -1.459693, -4.607219, 1, 1, 1, 1, 1,
-0.5751197, 0.0181862, -1.959428, 1, 1, 1, 1, 1,
-0.5712404, 0.10136, -3.929297, 1, 1, 1, 1, 1,
-0.5672588, -0.4574448, -2.100881, 1, 1, 1, 1, 1,
-0.5667641, -0.8958268, -2.105006, 0, 0, 1, 1, 1,
-0.565357, -0.3891743, -0.1632154, 1, 0, 0, 1, 1,
-0.5644164, 1.407976, -1.208422, 1, 0, 0, 1, 1,
-0.5630049, 0.001804155, -3.164504, 1, 0, 0, 1, 1,
-0.5617344, 1.172756, -0.2859783, 1, 0, 0, 1, 1,
-0.5602342, -1.720905, -2.181733, 1, 0, 0, 1, 1,
-0.5564871, -0.09508391, 0.2208364, 0, 0, 0, 1, 1,
-0.5514936, 1.373332, -1.174044, 0, 0, 0, 1, 1,
-0.5513012, -0.1869646, -1.210849, 0, 0, 0, 1, 1,
-0.5484022, 0.5820846, -1.077623, 0, 0, 0, 1, 1,
-0.5481035, 0.6096039, -2.120063, 0, 0, 0, 1, 1,
-0.5467619, -0.3593695, -1.030711, 0, 0, 0, 1, 1,
-0.5374537, -0.349128, -3.77142, 0, 0, 0, 1, 1,
-0.5364641, 2.016343, -1.679839, 1, 1, 1, 1, 1,
-0.5353012, -0.3149426, -0.8311528, 1, 1, 1, 1, 1,
-0.5351798, 0.1798548, 1.027635, 1, 1, 1, 1, 1,
-0.5334122, -0.5403733, -0.7874821, 1, 1, 1, 1, 1,
-0.5327335, -1.11668, -2.093858, 1, 1, 1, 1, 1,
-0.5290655, -0.2175207, -1.512751, 1, 1, 1, 1, 1,
-0.5282041, -0.05745307, -0.2219112, 1, 1, 1, 1, 1,
-0.5268782, -1.145315, -1.641072, 1, 1, 1, 1, 1,
-0.5186182, -1.336601, -0.8139321, 1, 1, 1, 1, 1,
-0.5124211, 0.832286, -1.914612, 1, 1, 1, 1, 1,
-0.5117217, 0.005605875, -1.134523, 1, 1, 1, 1, 1,
-0.5106918, 0.2965361, 1.177768, 1, 1, 1, 1, 1,
-0.509482, -1.618757, -3.78307, 1, 1, 1, 1, 1,
-0.5082679, -1.533312, -1.69617, 1, 1, 1, 1, 1,
-0.5056087, 0.027876, -2.267702, 1, 1, 1, 1, 1,
-0.5042493, 0.1074812, -2.129795, 0, 0, 1, 1, 1,
-0.5024239, 1.880775, 0.4684328, 1, 0, 0, 1, 1,
-0.5020959, 0.2239982, -0.5623751, 1, 0, 0, 1, 1,
-0.5006544, 1.57171, -0.3470016, 1, 0, 0, 1, 1,
-0.5005238, -0.2074312, -1.999066, 1, 0, 0, 1, 1,
-0.498073, -0.6606196, -3.867487, 1, 0, 0, 1, 1,
-0.4972064, -1.105201, -1.54315, 0, 0, 0, 1, 1,
-0.4954884, 0.1914893, -1.883921, 0, 0, 0, 1, 1,
-0.4933909, -0.485322, -2.872404, 0, 0, 0, 1, 1,
-0.4892234, -1.718344, -2.839751, 0, 0, 0, 1, 1,
-0.4873716, 0.05911762, -0.7199385, 0, 0, 0, 1, 1,
-0.4867667, -0.7728587, -3.896801, 0, 0, 0, 1, 1,
-0.4834109, -0.7039657, -2.450401, 0, 0, 0, 1, 1,
-0.479367, 0.1809594, -0.9654695, 1, 1, 1, 1, 1,
-0.473504, 0.01210372, -1.055982, 1, 1, 1, 1, 1,
-0.4723385, 0.9941201, 1.05563, 1, 1, 1, 1, 1,
-0.4657889, 1.414962, -1.241119, 1, 1, 1, 1, 1,
-0.4597585, 0.1900259, -0.1585834, 1, 1, 1, 1, 1,
-0.4597034, -0.426083, -2.381783, 1, 1, 1, 1, 1,
-0.4585134, 0.4013892, 0.5423334, 1, 1, 1, 1, 1,
-0.4583676, 0.008075977, -2.724677, 1, 1, 1, 1, 1,
-0.4576317, 0.6795812, -0.07529603, 1, 1, 1, 1, 1,
-0.4510323, -0.6050406, -1.938859, 1, 1, 1, 1, 1,
-0.4503177, 0.7408634, -0.2105526, 1, 1, 1, 1, 1,
-0.4484165, -1.614999, -3.23722, 1, 1, 1, 1, 1,
-0.4429004, 1.738997, -2.049303, 1, 1, 1, 1, 1,
-0.440245, -0.5874376, -2.726647, 1, 1, 1, 1, 1,
-0.4389468, 0.891345, 0.2104974, 1, 1, 1, 1, 1,
-0.4330527, -1.158767, -2.072757, 0, 0, 1, 1, 1,
-0.431812, -0.8020903, -2.384823, 1, 0, 0, 1, 1,
-0.4315656, -1.212282, -3.030711, 1, 0, 0, 1, 1,
-0.4315206, -2.566092, -2.659562, 1, 0, 0, 1, 1,
-0.4305297, 2.455154, -0.09552981, 1, 0, 0, 1, 1,
-0.4277645, -1.640086, -3.97072, 1, 0, 0, 1, 1,
-0.4267801, -0.6633902, -2.668765, 0, 0, 0, 1, 1,
-0.4251259, -0.3515122, -2.125885, 0, 0, 0, 1, 1,
-0.417692, -1.17634, -3.161852, 0, 0, 0, 1, 1,
-0.4166904, -1.422848, -3.400047, 0, 0, 0, 1, 1,
-0.4160447, 0.8412324, 0.1048235, 0, 0, 0, 1, 1,
-0.415503, 2.146481, 0.1935932, 0, 0, 0, 1, 1,
-0.4150022, 0.6809827, -1.014808, 0, 0, 0, 1, 1,
-0.4101461, 0.1101218, 0.02730874, 1, 1, 1, 1, 1,
-0.409343, -1.5378, -2.847355, 1, 1, 1, 1, 1,
-0.4091161, -0.9409524, -2.19576, 1, 1, 1, 1, 1,
-0.4073132, -1.064096, -2.711138, 1, 1, 1, 1, 1,
-0.4061557, -0.2296075, -2.187804, 1, 1, 1, 1, 1,
-0.4050724, -1.676596, -2.186238, 1, 1, 1, 1, 1,
-0.4048066, 1.265192, -1.239358, 1, 1, 1, 1, 1,
-0.4038242, -1.070765, -3.239887, 1, 1, 1, 1, 1,
-0.4004243, 0.1434154, -0.9621106, 1, 1, 1, 1, 1,
-0.3998843, -0.5623924, -2.323445, 1, 1, 1, 1, 1,
-0.3951511, 0.5426075, -0.8117797, 1, 1, 1, 1, 1,
-0.3950857, -0.7413766, -3.059587, 1, 1, 1, 1, 1,
-0.3895902, -0.9550898, -3.470701, 1, 1, 1, 1, 1,
-0.3832711, -0.08941326, -2.931725, 1, 1, 1, 1, 1,
-0.3822337, -1.459777, -1.957938, 1, 1, 1, 1, 1,
-0.373786, -0.631044, -3.646591, 0, 0, 1, 1, 1,
-0.3737464, 1.644639, -1.411781, 1, 0, 0, 1, 1,
-0.3687695, 0.5386032, -0.6018354, 1, 0, 0, 1, 1,
-0.3645358, -0.876569, -3.096593, 1, 0, 0, 1, 1,
-0.3600878, -1.291339, -1.371412, 1, 0, 0, 1, 1,
-0.354058, -0.7999434, -2.209621, 1, 0, 0, 1, 1,
-0.3525044, -0.3351057, -1.052557, 0, 0, 0, 1, 1,
-0.3522835, -2.068302, -1.707194, 0, 0, 0, 1, 1,
-0.3488422, -0.8245639, -1.020782, 0, 0, 0, 1, 1,
-0.3484034, 2.638536, -0.5369925, 0, 0, 0, 1, 1,
-0.3458297, 0.05797307, -2.785463, 0, 0, 0, 1, 1,
-0.3442928, -0.4425524, -1.395483, 0, 0, 0, 1, 1,
-0.3405987, -0.1586498, -1.251246, 0, 0, 0, 1, 1,
-0.340136, -1.559043, -2.106508, 1, 1, 1, 1, 1,
-0.3400318, 0.2246018, -2.975402, 1, 1, 1, 1, 1,
-0.33353, 0.2389927, -1.253452, 1, 1, 1, 1, 1,
-0.3320465, 0.01926668, -1.663072, 1, 1, 1, 1, 1,
-0.3320317, 0.4173699, 1.255938, 1, 1, 1, 1, 1,
-0.3301732, -0.3336096, -3.913237, 1, 1, 1, 1, 1,
-0.3283489, -0.4939316, -1.416378, 1, 1, 1, 1, 1,
-0.3236251, -1.083674, -1.456372, 1, 1, 1, 1, 1,
-0.3214053, 0.57885, -1.285304, 1, 1, 1, 1, 1,
-0.3162687, 0.1655287, -0.4959763, 1, 1, 1, 1, 1,
-0.3155357, 0.08693532, -1.137856, 1, 1, 1, 1, 1,
-0.3126462, 0.3343548, 0.606517, 1, 1, 1, 1, 1,
-0.3123358, 0.6864662, -0.1917777, 1, 1, 1, 1, 1,
-0.3109595, 1.3845, 0.8023776, 1, 1, 1, 1, 1,
-0.3100037, -0.10754, -1.974017, 1, 1, 1, 1, 1,
-0.3075399, -0.5107878, -3.192277, 0, 0, 1, 1, 1,
-0.3038868, -1.291601, -3.755859, 1, 0, 0, 1, 1,
-0.3022274, -1.357521, -2.671951, 1, 0, 0, 1, 1,
-0.3018453, -0.9466375, -2.656789, 1, 0, 0, 1, 1,
-0.2985003, 0.5891249, 1.525807, 1, 0, 0, 1, 1,
-0.2974498, -0.4187627, -2.540382, 1, 0, 0, 1, 1,
-0.2970715, 0.6835923, 1.787451, 0, 0, 0, 1, 1,
-0.2874149, -0.1735504, -2.389755, 0, 0, 0, 1, 1,
-0.2862388, -0.1688001, -3.01204, 0, 0, 0, 1, 1,
-0.2838951, -0.5257725, -2.590351, 0, 0, 0, 1, 1,
-0.2801723, -0.376771, -1.536972, 0, 0, 0, 1, 1,
-0.2788574, -0.4914937, -1.332904, 0, 0, 0, 1, 1,
-0.2781431, -0.6958723, -3.789274, 0, 0, 0, 1, 1,
-0.2765058, 0.4382303, -0.5202471, 1, 1, 1, 1, 1,
-0.2753208, -0.3434038, -2.41286, 1, 1, 1, 1, 1,
-0.2698764, 0.8624471, -1.526933, 1, 1, 1, 1, 1,
-0.2678092, -2.166772, -2.443868, 1, 1, 1, 1, 1,
-0.2672096, -0.6897056, -5.221197, 1, 1, 1, 1, 1,
-0.2667869, 1.081515, 1.022023, 1, 1, 1, 1, 1,
-0.2582106, -1.191179, -3.717587, 1, 1, 1, 1, 1,
-0.2550446, -0.7021374, -4.456852, 1, 1, 1, 1, 1,
-0.2513492, 0.00747079, -1.562702, 1, 1, 1, 1, 1,
-0.2509049, 1.469971, -0.04376351, 1, 1, 1, 1, 1,
-0.2487311, -0.2622574, -3.035829, 1, 1, 1, 1, 1,
-0.2330051, -1.26197, -0.756101, 1, 1, 1, 1, 1,
-0.2267155, 0.1168381, 0.7202332, 1, 1, 1, 1, 1,
-0.2134543, -0.04029451, -3.35475, 1, 1, 1, 1, 1,
-0.2133085, 0.3777906, -1.83716, 1, 1, 1, 1, 1,
-0.2132429, 0.729418, -0.7893852, 0, 0, 1, 1, 1,
-0.2089293, -1.797047, -4.938879, 1, 0, 0, 1, 1,
-0.2085395, 0.4209136, -0.3639153, 1, 0, 0, 1, 1,
-0.2067436, 0.1443205, -1.248083, 1, 0, 0, 1, 1,
-0.20649, -0.5441378, -2.767716, 1, 0, 0, 1, 1,
-0.1958418, -1.131162, -1.080391, 1, 0, 0, 1, 1,
-0.1902619, -0.1806934, -3.418477, 0, 0, 0, 1, 1,
-0.189145, 0.3493175, -0.6912985, 0, 0, 0, 1, 1,
-0.1888231, 0.7550132, -0.3365343, 0, 0, 0, 1, 1,
-0.1887606, -0.2247369, -2.578373, 0, 0, 0, 1, 1,
-0.1857074, 0.3077616, -0.5962092, 0, 0, 0, 1, 1,
-0.1835464, -0.3895529, -1.804816, 0, 0, 0, 1, 1,
-0.1787176, 1.143949, -0.4184799, 0, 0, 0, 1, 1,
-0.1778273, 0.4208705, -0.4936564, 1, 1, 1, 1, 1,
-0.1674477, -0.7643477, -2.562425, 1, 1, 1, 1, 1,
-0.166593, -1.086769, -2.224521, 1, 1, 1, 1, 1,
-0.1659572, -1.391547, -1.644938, 1, 1, 1, 1, 1,
-0.1579188, -0.417686, -2.936591, 1, 1, 1, 1, 1,
-0.1574809, -1.696416, -4.455015, 1, 1, 1, 1, 1,
-0.1553131, 0.2538961, -0.4023038, 1, 1, 1, 1, 1,
-0.1521894, 0.04701543, -1.664637, 1, 1, 1, 1, 1,
-0.1515941, -2.10548, -3.395949, 1, 1, 1, 1, 1,
-0.1442828, -0.3356901, -3.846963, 1, 1, 1, 1, 1,
-0.1442498, 0.7140607, 0.4205559, 1, 1, 1, 1, 1,
-0.1437576, -0.3954498, -3.7421, 1, 1, 1, 1, 1,
-0.1406167, -0.3763586, -2.498768, 1, 1, 1, 1, 1,
-0.138906, -0.03754608, -1.986465, 1, 1, 1, 1, 1,
-0.1357583, 0.7447917, 0.44214, 1, 1, 1, 1, 1,
-0.1336277, -1.067015, -3.139028, 0, 0, 1, 1, 1,
-0.1320976, -0.007351737, -0.176898, 1, 0, 0, 1, 1,
-0.1320971, -0.5188807, -3.029211, 1, 0, 0, 1, 1,
-0.1273128, 0.8052488, 1.766493, 1, 0, 0, 1, 1,
-0.1204629, -0.1270062, -1.005246, 1, 0, 0, 1, 1,
-0.1192072, -1.485283, -5.83744, 1, 0, 0, 1, 1,
-0.1190991, 0.05524746, -0.90957, 0, 0, 0, 1, 1,
-0.1163491, 1.070894, 1.131065, 0, 0, 0, 1, 1,
-0.1140228, -1.200489, -4.402183, 0, 0, 0, 1, 1,
-0.1123639, -0.5401075, -1.88075, 0, 0, 0, 1, 1,
-0.1108947, -1.594703, -3.851653, 0, 0, 0, 1, 1,
-0.1093063, 0.09633516, -1.459212, 0, 0, 0, 1, 1,
-0.1086463, 0.1084775, -0.6724889, 0, 0, 0, 1, 1,
-0.1065864, 1.968073, -0.9421462, 1, 1, 1, 1, 1,
-0.1064564, 0.7432566, 0.5080743, 1, 1, 1, 1, 1,
-0.1039436, 0.4860736, 0.3256242, 1, 1, 1, 1, 1,
-0.1022429, 0.5737499, 1.121571, 1, 1, 1, 1, 1,
-0.1013367, -0.8819129, -2.382021, 1, 1, 1, 1, 1,
-0.09774787, -1.330634, -3.141333, 1, 1, 1, 1, 1,
-0.09652015, -0.2175908, -3.23507, 1, 1, 1, 1, 1,
-0.09203678, 0.8527704, 1.081035, 1, 1, 1, 1, 1,
-0.0816846, 1.208212, 1.070286, 1, 1, 1, 1, 1,
-0.08097265, 1.298794, -0.9706154, 1, 1, 1, 1, 1,
-0.07919891, 0.8874042, 0.2043649, 1, 1, 1, 1, 1,
-0.07791183, 0.402488, -1.045855, 1, 1, 1, 1, 1,
-0.07611733, 0.007072815, -1.136101, 1, 1, 1, 1, 1,
-0.07165828, -1.295604, -2.903433, 1, 1, 1, 1, 1,
-0.07121687, 1.066752, -0.4879591, 1, 1, 1, 1, 1,
-0.07099877, -0.01413779, -2.040107, 0, 0, 1, 1, 1,
-0.07075203, 1.985775, 0.1559544, 1, 0, 0, 1, 1,
-0.06839375, 0.7671835, -0.4998705, 1, 0, 0, 1, 1,
-0.06666238, 0.3520492, -0.4942439, 1, 0, 0, 1, 1,
-0.06601459, 0.7527383, 2.201187, 1, 0, 0, 1, 1,
-0.06600799, 0.1857824, 1.126199, 1, 0, 0, 1, 1,
-0.06155003, 0.9122163, 0.7494377, 0, 0, 0, 1, 1,
-0.06122568, -0.01515302, -1.896715, 0, 0, 0, 1, 1,
-0.05930449, 0.178669, -0.400175, 0, 0, 0, 1, 1,
-0.05681071, -0.03696532, -0.7350646, 0, 0, 0, 1, 1,
-0.05520241, 0.8056112, -0.7453052, 0, 0, 0, 1, 1,
-0.05443827, 0.1418003, -1.381966, 0, 0, 0, 1, 1,
-0.05327972, 1.307389, 1.006533, 0, 0, 0, 1, 1,
-0.0530669, 0.5678331, 1.324237, 1, 1, 1, 1, 1,
-0.04845611, 0.3181659, 1.383339, 1, 1, 1, 1, 1,
-0.04642201, -1.387643, -5.160879, 1, 1, 1, 1, 1,
-0.04500273, 0.9555215, -1.673712, 1, 1, 1, 1, 1,
-0.04486869, -1.524054, -2.449166, 1, 1, 1, 1, 1,
-0.04365786, 1.136821, -0.928588, 1, 1, 1, 1, 1,
-0.03973305, -2.696467, -3.713207, 1, 1, 1, 1, 1,
-0.03947574, -0.929148, -3.222648, 1, 1, 1, 1, 1,
-0.03912807, -0.7880102, -3.427976, 1, 1, 1, 1, 1,
-0.03868007, -0.6674957, -3.099934, 1, 1, 1, 1, 1,
-0.03307843, -0.3469428, -2.067014, 1, 1, 1, 1, 1,
-0.0324631, -0.01110794, -0.4380838, 1, 1, 1, 1, 1,
-0.03190064, 0.293914, 1.144485, 1, 1, 1, 1, 1,
-0.03032028, -0.3694752, -2.828045, 1, 1, 1, 1, 1,
-0.02925378, -1.943931, -2.941356, 1, 1, 1, 1, 1,
-0.027718, 0.3632212, -0.9964139, 0, 0, 1, 1, 1,
-0.02736527, -0.9715785, 0.7294131, 1, 0, 0, 1, 1,
-0.02539455, -1.728821, -2.266126, 1, 0, 0, 1, 1,
-0.02537833, 0.4958677, -0.8254457, 1, 0, 0, 1, 1,
-0.02481039, 0.1397126, 0.3506587, 1, 0, 0, 1, 1,
-0.02476756, -1.362268, -3.100106, 1, 0, 0, 1, 1,
-0.02399875, -0.136308, -2.085073, 0, 0, 0, 1, 1,
-0.02364555, 0.8834091, 1.255412, 0, 0, 0, 1, 1,
-0.02103492, -0.7303271, -3.348313, 0, 0, 0, 1, 1,
-0.01427988, -1.055049, -2.234748, 0, 0, 0, 1, 1,
-0.003532764, 0.127067, -0.7737058, 0, 0, 0, 1, 1,
-0.001109389, -0.5276327, -2.413722, 0, 0, 0, 1, 1,
0.001240592, 1.01867, 1.325602, 0, 0, 0, 1, 1,
0.004077899, 0.1113825, 0.2736051, 1, 1, 1, 1, 1,
0.006113927, -0.6363441, 2.953904, 1, 1, 1, 1, 1,
0.01175541, -0.8757827, 3.20031, 1, 1, 1, 1, 1,
0.0166445, 0.5315925, 1.273358, 1, 1, 1, 1, 1,
0.02141366, 1.628782, -1.11535, 1, 1, 1, 1, 1,
0.02602214, -2.161831, 3.489631, 1, 1, 1, 1, 1,
0.03745, -0.2122257, 1.538418, 1, 1, 1, 1, 1,
0.03755181, -1.004693, 4.1189, 1, 1, 1, 1, 1,
0.04315454, 0.7036074, 1.473896, 1, 1, 1, 1, 1,
0.04499686, -1.190886, 2.040846, 1, 1, 1, 1, 1,
0.04678457, 0.4202998, -1.211985, 1, 1, 1, 1, 1,
0.04894305, 0.1852612, 0.7375705, 1, 1, 1, 1, 1,
0.05043657, -0.4622822, 2.635214, 1, 1, 1, 1, 1,
0.05331979, -1.032479, 1.614791, 1, 1, 1, 1, 1,
0.05445937, 0.6482095, -0.9184726, 1, 1, 1, 1, 1,
0.05611762, -1.577118, 5.703, 0, 0, 1, 1, 1,
0.05721203, 0.5315039, 0.1754283, 1, 0, 0, 1, 1,
0.0597414, -0.6577745, 2.346835, 1, 0, 0, 1, 1,
0.06169897, -0.6500123, 3.282637, 1, 0, 0, 1, 1,
0.06255753, -0.6318064, 4.13519, 1, 0, 0, 1, 1,
0.07024289, 0.3108133, 0.5518171, 1, 0, 0, 1, 1,
0.07316216, 0.4564998, 0.8530616, 0, 0, 0, 1, 1,
0.07648525, -0.1031271, 2.295424, 0, 0, 0, 1, 1,
0.07720781, -0.452686, 3.486473, 0, 0, 0, 1, 1,
0.07779578, -1.193011, 2.668984, 0, 0, 0, 1, 1,
0.07921843, -0.4180093, 2.699316, 0, 0, 0, 1, 1,
0.08105467, -1.217181, 2.467916, 0, 0, 0, 1, 1,
0.08142284, -0.09297914, 2.942098, 0, 0, 0, 1, 1,
0.08386902, 0.1784614, 1.330219, 1, 1, 1, 1, 1,
0.08422807, 0.2962707, 0.9885623, 1, 1, 1, 1, 1,
0.08430138, -0.0278997, 4.768909, 1, 1, 1, 1, 1,
0.08853168, -1.717108, 2.197011, 1, 1, 1, 1, 1,
0.09296167, -0.4506024, 1.960625, 1, 1, 1, 1, 1,
0.1021345, 1.127485, -0.5271763, 1, 1, 1, 1, 1,
0.1097009, 0.2771053, -0.8866379, 1, 1, 1, 1, 1,
0.109876, -0.7823142, 2.345318, 1, 1, 1, 1, 1,
0.1108202, -0.4791352, 2.755554, 1, 1, 1, 1, 1,
0.1146236, 0.0258995, 3.120575, 1, 1, 1, 1, 1,
0.1157784, 0.7930248, 0.7695646, 1, 1, 1, 1, 1,
0.1187093, -1.965272, 3.98385, 1, 1, 1, 1, 1,
0.119683, 0.02644444, 1.862689, 1, 1, 1, 1, 1,
0.1230549, 1.600057, 0.5912409, 1, 1, 1, 1, 1,
0.1325264, 0.5248492, 2.088752, 1, 1, 1, 1, 1,
0.1403518, -1.103135, 3.516554, 0, 0, 1, 1, 1,
0.1420945, 1.227842, -0.9245059, 1, 0, 0, 1, 1,
0.1421492, 1.002049, 0.6605982, 1, 0, 0, 1, 1,
0.1439319, -1.176403, 2.380024, 1, 0, 0, 1, 1,
0.1481384, -0.9848472, 3.185129, 1, 0, 0, 1, 1,
0.1482056, 0.4187633, 0.6903586, 1, 0, 0, 1, 1,
0.1517122, 0.7533479, -0.1928701, 0, 0, 0, 1, 1,
0.152383, 0.7827429, -0.1019941, 0, 0, 0, 1, 1,
0.1525002, 0.5386076, 0.3688737, 0, 0, 0, 1, 1,
0.1553827, 1.160254, 2.963485, 0, 0, 0, 1, 1,
0.1568093, -1.294074, 3.57478, 0, 0, 0, 1, 1,
0.158061, 0.2772122, -0.3914031, 0, 0, 0, 1, 1,
0.1585058, -2.390323, 1.843381, 0, 0, 0, 1, 1,
0.1612284, -0.5928845, 3.472421, 1, 1, 1, 1, 1,
0.1662916, 0.1441768, 0.1929746, 1, 1, 1, 1, 1,
0.1695971, 0.8514632, 0.2217826, 1, 1, 1, 1, 1,
0.1733141, -1.000372, 2.050801, 1, 1, 1, 1, 1,
0.1775968, -1.970916, 3.825365, 1, 1, 1, 1, 1,
0.1849202, -1.398201, 3.643597, 1, 1, 1, 1, 1,
0.1870196, -0.02734971, 2.184813, 1, 1, 1, 1, 1,
0.1886934, 0.2741006, 1.571775, 1, 1, 1, 1, 1,
0.1907337, 2.505436, 0.6442272, 1, 1, 1, 1, 1,
0.1911181, -0.8156027, 2.539283, 1, 1, 1, 1, 1,
0.1920122, -0.01269044, -0.1392684, 1, 1, 1, 1, 1,
0.1921683, 1.685373, 0.5644662, 1, 1, 1, 1, 1,
0.192398, -0.1199421, 1.133096, 1, 1, 1, 1, 1,
0.1927129, -0.5092314, 2.185808, 1, 1, 1, 1, 1,
0.1973121, 1.500859, 0.8415923, 1, 1, 1, 1, 1,
0.1995319, -0.2029313, 2.467778, 0, 0, 1, 1, 1,
0.2028262, -1.416113, 1.922465, 1, 0, 0, 1, 1,
0.2038541, 0.5165585, 0.06352375, 1, 0, 0, 1, 1,
0.205541, 1.614931, 0.06440386, 1, 0, 0, 1, 1,
0.2059334, 1.39616, -2.133469, 1, 0, 0, 1, 1,
0.2092974, 0.04710692, 1.727413, 1, 0, 0, 1, 1,
0.2149669, 1.390401, 1.624026, 0, 0, 0, 1, 1,
0.220798, 0.07821715, 1.884697, 0, 0, 0, 1, 1,
0.2227506, 0.8939158, 0.009807845, 0, 0, 0, 1, 1,
0.22511, 0.3342817, 1.97169, 0, 0, 0, 1, 1,
0.2261549, 0.06904713, 2.170832, 0, 0, 0, 1, 1,
0.2310781, 0.496398, 0.3675243, 0, 0, 0, 1, 1,
0.2324683, -0.9723468, 4.388965, 0, 0, 0, 1, 1,
0.2327142, 0.9205577, 0.7934659, 1, 1, 1, 1, 1,
0.2342124, -0.3999492, 3.515772, 1, 1, 1, 1, 1,
0.2357134, 0.2762692, 1.414793, 1, 1, 1, 1, 1,
0.2384941, -0.6729749, 3.870676, 1, 1, 1, 1, 1,
0.2407831, -0.4141621, 1.240418, 1, 1, 1, 1, 1,
0.2461307, -0.8606958, 2.444342, 1, 1, 1, 1, 1,
0.247436, -0.7274088, 2.06601, 1, 1, 1, 1, 1,
0.2483241, -0.9099391, 2.802284, 1, 1, 1, 1, 1,
0.2496548, 1.179512, 0.07451811, 1, 1, 1, 1, 1,
0.2515523, 0.08913623, 2.416643, 1, 1, 1, 1, 1,
0.2562651, 2.347248, 1.946337, 1, 1, 1, 1, 1,
0.2595405, 0.7146531, 0.9386499, 1, 1, 1, 1, 1,
0.2599252, -0.08238694, 1.630413, 1, 1, 1, 1, 1,
0.2606836, -0.2313258, 2.832026, 1, 1, 1, 1, 1,
0.2678311, -0.1620354, 0.9357612, 1, 1, 1, 1, 1,
0.2718724, 0.349653, 1.939764, 0, 0, 1, 1, 1,
0.272944, -0.1233051, 2.560891, 1, 0, 0, 1, 1,
0.2761455, -0.1284071, 0.2741244, 1, 0, 0, 1, 1,
0.2771918, -1.493967, 1.851678, 1, 0, 0, 1, 1,
0.2883271, -0.5718243, 1.741861, 1, 0, 0, 1, 1,
0.2889158, 0.2143605, 1.788839, 1, 0, 0, 1, 1,
0.2894391, -0.2904674, 1.481119, 0, 0, 0, 1, 1,
0.2928182, 1.274465, 0.2612424, 0, 0, 0, 1, 1,
0.2969472, -0.5231456, 2.561811, 0, 0, 0, 1, 1,
0.2978899, 0.4778093, 0.9709852, 0, 0, 0, 1, 1,
0.304048, 0.3095616, -0.2811213, 0, 0, 0, 1, 1,
0.3050847, -0.4279172, 3.730665, 0, 0, 0, 1, 1,
0.3054742, -0.8407668, 3.716046, 0, 0, 0, 1, 1,
0.3067827, -0.5678466, 1.360428, 1, 1, 1, 1, 1,
0.3089175, -1.00538, 0.5128924, 1, 1, 1, 1, 1,
0.3116904, 1.635286, -1.556769, 1, 1, 1, 1, 1,
0.3127169, -1.148205, 4.487715, 1, 1, 1, 1, 1,
0.3204726, -0.3792932, 2.307732, 1, 1, 1, 1, 1,
0.3218712, 0.8208868, 0.4446205, 1, 1, 1, 1, 1,
0.3321025, -0.4113061, 2.08919, 1, 1, 1, 1, 1,
0.3336929, 0.4854796, 1.705274, 1, 1, 1, 1, 1,
0.3354829, -1.480707, 4.255075, 1, 1, 1, 1, 1,
0.3356814, -0.1343696, 2.264728, 1, 1, 1, 1, 1,
0.3362736, 1.802467, 0.5868104, 1, 1, 1, 1, 1,
0.3397867, -1.041608, 2.104097, 1, 1, 1, 1, 1,
0.3433411, 2.336241, 1.840452, 1, 1, 1, 1, 1,
0.3456131, -0.3310959, 1.744195, 1, 1, 1, 1, 1,
0.3477484, 0.8927664, 0.7420205, 1, 1, 1, 1, 1,
0.3491945, 0.8234274, -1.024793, 0, 0, 1, 1, 1,
0.3513806, 0.4384566, -0.754255, 1, 0, 0, 1, 1,
0.3547467, 2.591488, 0.5209381, 1, 0, 0, 1, 1,
0.3562658, 1.5669, 0.8129858, 1, 0, 0, 1, 1,
0.3600287, -0.5204141, 2.411159, 1, 0, 0, 1, 1,
0.3604784, -0.7522067, 2.572157, 1, 0, 0, 1, 1,
0.3618562, -0.1766159, 2.504652, 0, 0, 0, 1, 1,
0.3701614, 0.5233066, 2.832105, 0, 0, 0, 1, 1,
0.3719877, 1.534846, 0.7191779, 0, 0, 0, 1, 1,
0.3729483, 1.461939, -1.204936, 0, 0, 0, 1, 1,
0.3747809, -0.5251589, 2.157237, 0, 0, 0, 1, 1,
0.375541, -0.8459136, 3.40953, 0, 0, 0, 1, 1,
0.3764578, -0.5574566, 1.905721, 0, 0, 0, 1, 1,
0.3781698, 0.4951025, 1.274572, 1, 1, 1, 1, 1,
0.3802924, 1.070964, 0.2447714, 1, 1, 1, 1, 1,
0.3845197, 1.574518, 1.718841, 1, 1, 1, 1, 1,
0.3859695, 1.128267, 0.2582084, 1, 1, 1, 1, 1,
0.390361, 0.5813306, 0.9107799, 1, 1, 1, 1, 1,
0.3973794, 1.095471, 0.8980539, 1, 1, 1, 1, 1,
0.4014311, -0.7048811, 1.883143, 1, 1, 1, 1, 1,
0.4014705, 0.5513135, 0.6812363, 1, 1, 1, 1, 1,
0.4061407, -0.7809301, 1.224545, 1, 1, 1, 1, 1,
0.4088446, -0.8232667, 2.076117, 1, 1, 1, 1, 1,
0.4124124, 0.2677015, 1.535799, 1, 1, 1, 1, 1,
0.4126425, -1.013318, 3.033801, 1, 1, 1, 1, 1,
0.4220131, 0.8043859, 0.4573687, 1, 1, 1, 1, 1,
0.4220884, 0.2339142, 0.5043551, 1, 1, 1, 1, 1,
0.425562, 0.371573, 0.009102557, 1, 1, 1, 1, 1,
0.4290247, -0.04604484, 1.500368, 0, 0, 1, 1, 1,
0.4297429, -0.323306, 2.043583, 1, 0, 0, 1, 1,
0.4310424, -0.8090235, 1.382792, 1, 0, 0, 1, 1,
0.4374276, -0.5769241, 2.388975, 1, 0, 0, 1, 1,
0.4388493, 0.4733765, -0.2375816, 1, 0, 0, 1, 1,
0.44188, -0.1085909, 0.9274105, 1, 0, 0, 1, 1,
0.4424278, -1.545267, 3.557383, 0, 0, 0, 1, 1,
0.4434778, -0.05354597, 1.291775, 0, 0, 0, 1, 1,
0.4440477, -0.3433714, 1.261515, 0, 0, 0, 1, 1,
0.4445977, -0.2077004, 2.748761, 0, 0, 0, 1, 1,
0.4453781, -0.3422073, 1.685006, 0, 0, 0, 1, 1,
0.4470017, 1.343073, -0.6735212, 0, 0, 0, 1, 1,
0.4535315, -2.074642, 2.130364, 0, 0, 0, 1, 1,
0.4566138, -0.5778308, 3.160718, 1, 1, 1, 1, 1,
0.4566659, -1.473512, 3.209593, 1, 1, 1, 1, 1,
0.4648676, 0.7676243, -0.7606038, 1, 1, 1, 1, 1,
0.4656311, 0.7329648, -0.2658384, 1, 1, 1, 1, 1,
0.4659389, 0.5835386, 0.3130963, 1, 1, 1, 1, 1,
0.4704526, 0.1246886, 2.056395, 1, 1, 1, 1, 1,
0.4718339, 0.1851511, 2.796779, 1, 1, 1, 1, 1,
0.4760154, -1.524449, 3.791909, 1, 1, 1, 1, 1,
0.4851728, -0.0001187439, 1.921, 1, 1, 1, 1, 1,
0.4874009, 1.413858, -0.7087685, 1, 1, 1, 1, 1,
0.4874343, -1.087457, 2.065592, 1, 1, 1, 1, 1,
0.489151, -1.320312, 4.255691, 1, 1, 1, 1, 1,
0.4906733, -0.3818463, 3.596138, 1, 1, 1, 1, 1,
0.4924222, 0.1775883, 0.2615449, 1, 1, 1, 1, 1,
0.4969231, 0.1319833, 2.166237, 1, 1, 1, 1, 1,
0.4973368, 1.064439, 0.6715579, 0, 0, 1, 1, 1,
0.4976604, 1.691709, 0.1037673, 1, 0, 0, 1, 1,
0.5003363, -1.437853, 2.177151, 1, 0, 0, 1, 1,
0.5092885, -0.3939442, 2.063762, 1, 0, 0, 1, 1,
0.5095423, -0.6837016, 0.826074, 1, 0, 0, 1, 1,
0.511775, 0.3176762, 2.25, 1, 0, 0, 1, 1,
0.5159593, -0.8511654, 2.919448, 0, 0, 0, 1, 1,
0.5174578, 0.9016625, -0.6759666, 0, 0, 0, 1, 1,
0.5175799, -0.09714013, 0.9818811, 0, 0, 0, 1, 1,
0.5184512, -0.963555, 1.771762, 0, 0, 0, 1, 1,
0.5207534, 0.3204593, 0.147227, 0, 0, 0, 1, 1,
0.5217842, -0.04371185, 0.9860534, 0, 0, 0, 1, 1,
0.5270866, -0.2325099, 2.079926, 0, 0, 0, 1, 1,
0.5293571, -0.4215291, 1.445137, 1, 1, 1, 1, 1,
0.532757, -1.011414, 2.097983, 1, 1, 1, 1, 1,
0.5334139, -0.5723183, 3.113955, 1, 1, 1, 1, 1,
0.5361705, 1.11856, -0.5607571, 1, 1, 1, 1, 1,
0.5372474, -0.01349428, 0.8739653, 1, 1, 1, 1, 1,
0.5381037, 0.2834409, 1.190196, 1, 1, 1, 1, 1,
0.5466353, -0.1471936, 2.362909, 1, 1, 1, 1, 1,
0.5498756, 0.2710987, 1.251302, 1, 1, 1, 1, 1,
0.5537657, -1.504397, 3.475049, 1, 1, 1, 1, 1,
0.5594416, -2.188925, 1.9193, 1, 1, 1, 1, 1,
0.561842, 0.3488961, 0.6781421, 1, 1, 1, 1, 1,
0.5619204, -1.381196, 2.383168, 1, 1, 1, 1, 1,
0.5624836, -1.222018, 3.342245, 1, 1, 1, 1, 1,
0.562711, -0.6048077, 2.87795, 1, 1, 1, 1, 1,
0.5681962, 0.4429815, 3.227133, 1, 1, 1, 1, 1,
0.5723527, -0.7045034, 0.5312276, 0, 0, 1, 1, 1,
0.5735305, -0.7819405, 2.942154, 1, 0, 0, 1, 1,
0.5738475, 0.3989929, 1.542361, 1, 0, 0, 1, 1,
0.5755585, 1.138147, 0.5238574, 1, 0, 0, 1, 1,
0.5843618, 0.2878463, 1.462231, 1, 0, 0, 1, 1,
0.5852296, -0.0420464, 2.647745, 1, 0, 0, 1, 1,
0.5884327, 0.7709925, 0.7990267, 0, 0, 0, 1, 1,
0.6021101, -1.198666, 2.991278, 0, 0, 0, 1, 1,
0.603898, 0.7998719, 1.474344, 0, 0, 0, 1, 1,
0.604739, -0.952115, 3.138918, 0, 0, 0, 1, 1,
0.6074717, 0.2241969, -1.205117, 0, 0, 0, 1, 1,
0.6083462, -0.4744327, 4.676673, 0, 0, 0, 1, 1,
0.6122348, -0.2082799, 1.813564, 0, 0, 0, 1, 1,
0.6240479, -0.2237981, 1.58121, 1, 1, 1, 1, 1,
0.6332887, -0.1246108, 0.5074863, 1, 1, 1, 1, 1,
0.6339832, 2.246773, 1.568887, 1, 1, 1, 1, 1,
0.635295, 0.3230285, 2.566066, 1, 1, 1, 1, 1,
0.636426, -0.6981077, 3.614526, 1, 1, 1, 1, 1,
0.6414306, -0.760174, 2.302802, 1, 1, 1, 1, 1,
0.6418115, -0.03347521, -0.311913, 1, 1, 1, 1, 1,
0.6424443, -1.344334, 2.954995, 1, 1, 1, 1, 1,
0.6453218, 0.3932663, 0.5204062, 1, 1, 1, 1, 1,
0.6466416, 1.27263, -0.8506864, 1, 1, 1, 1, 1,
0.6486947, 0.20095, 1.813241, 1, 1, 1, 1, 1,
0.6513705, 0.07507106, 2.032838, 1, 1, 1, 1, 1,
0.6537731, -0.2417718, 2.42758, 1, 1, 1, 1, 1,
0.6540777, 1.414271, 0.3671849, 1, 1, 1, 1, 1,
0.6552171, -0.4628224, 2.880034, 1, 1, 1, 1, 1,
0.6553398, -0.487081, 0.9157282, 0, 0, 1, 1, 1,
0.6555678, 0.7388185, 1.413147, 1, 0, 0, 1, 1,
0.6570922, -1.111958, 4.038888, 1, 0, 0, 1, 1,
0.6575217, 0.1805675, 1.205883, 1, 0, 0, 1, 1,
0.6579539, -0.1628341, 1.240495, 1, 0, 0, 1, 1,
0.6586967, -1.277912, 3.965, 1, 0, 0, 1, 1,
0.6642337, 0.2835646, -0.01111861, 0, 0, 0, 1, 1,
0.6643542, 0.6141955, 1.892051, 0, 0, 0, 1, 1,
0.6656902, -0.5469459, 5.034526, 0, 0, 0, 1, 1,
0.6665028, -1.201071, 2.691065, 0, 0, 0, 1, 1,
0.6784141, 1.226547, 1.668266, 0, 0, 0, 1, 1,
0.6789164, 1.126129, 0.4156404, 0, 0, 0, 1, 1,
0.6805652, -1.208276, 1.892032, 0, 0, 0, 1, 1,
0.6830727, -1.49461, 3.827628, 1, 1, 1, 1, 1,
0.6833501, 0.1503254, 0.7506377, 1, 1, 1, 1, 1,
0.6838278, 0.07929388, 0.6544167, 1, 1, 1, 1, 1,
0.6852496, 0.3097861, 0.8058868, 1, 1, 1, 1, 1,
0.6943307, -0.756899, 2.147686, 1, 1, 1, 1, 1,
0.6967608, 1.74835, -0.2392526, 1, 1, 1, 1, 1,
0.7032623, -0.7662714, 0.9718237, 1, 1, 1, 1, 1,
0.7036734, -0.7495199, 2.70287, 1, 1, 1, 1, 1,
0.7060084, -0.2033651, 1.211376, 1, 1, 1, 1, 1,
0.7080217, -1.38485, 4.044837, 1, 1, 1, 1, 1,
0.7094587, -0.05504225, -0.01157108, 1, 1, 1, 1, 1,
0.7166332, 1.123483, 0.6987296, 1, 1, 1, 1, 1,
0.7202822, 0.4575677, 1.0498, 1, 1, 1, 1, 1,
0.7213688, 0.5542848, 1.679134, 1, 1, 1, 1, 1,
0.7219371, -1.045638, 1.733425, 1, 1, 1, 1, 1,
0.7278357, 0.3803214, 2.614071, 0, 0, 1, 1, 1,
0.7296303, -1.123356, 1.789401, 1, 0, 0, 1, 1,
0.7324827, 0.9731922, 1.190155, 1, 0, 0, 1, 1,
0.7360365, 0.1352561, 1.319978, 1, 0, 0, 1, 1,
0.7362017, -1.201605, 2.982622, 1, 0, 0, 1, 1,
0.7406061, -0.05624289, 1.813949, 1, 0, 0, 1, 1,
0.7470206, -0.9741423, 3.519897, 0, 0, 0, 1, 1,
0.7572941, 1.377176, -1.484675, 0, 0, 0, 1, 1,
0.7636361, 1.221575, 2.332824, 0, 0, 0, 1, 1,
0.7800412, 0.4739843, -0.5105305, 0, 0, 0, 1, 1,
0.7807863, 0.4537362, 1.909834, 0, 0, 0, 1, 1,
0.781367, -1.894305, 1.297912, 0, 0, 0, 1, 1,
0.7913643, 0.09781525, 1.384875, 0, 0, 0, 1, 1,
0.7942025, -0.04859687, 3.085713, 1, 1, 1, 1, 1,
0.7955868, 1.661279, -0.1835023, 1, 1, 1, 1, 1,
0.7978286, -0.7480736, 2.765892, 1, 1, 1, 1, 1,
0.7986625, 1.262369, 0.04404552, 1, 1, 1, 1, 1,
0.8007982, -0.007208504, 2.638235, 1, 1, 1, 1, 1,
0.8148443, -2.313651, 2.685994, 1, 1, 1, 1, 1,
0.8155071, 0.5542212, 1.024147, 1, 1, 1, 1, 1,
0.8253356, 0.1335152, 1.666489, 1, 1, 1, 1, 1,
0.8261106, 2.299343, -0.2524968, 1, 1, 1, 1, 1,
0.8272036, 0.4884159, 0.02223915, 1, 1, 1, 1, 1,
0.8274173, -0.6121178, 2.772978, 1, 1, 1, 1, 1,
0.8356097, -0.362168, 3.644421, 1, 1, 1, 1, 1,
0.840991, -1.415933, 2.107364, 1, 1, 1, 1, 1,
0.8468829, -2.916562, 2.325282, 1, 1, 1, 1, 1,
0.8470521, -1.754516, 1.163678, 1, 1, 1, 1, 1,
0.8475488, -0.1561064, 2.796041, 0, 0, 1, 1, 1,
0.8499193, 0.2108414, 1.669565, 1, 0, 0, 1, 1,
0.8511147, -0.2472894, 0.959411, 1, 0, 0, 1, 1,
0.8604913, -1.185549, 2.484485, 1, 0, 0, 1, 1,
0.8626168, -0.2517205, 0.2739902, 1, 0, 0, 1, 1,
0.8638549, -0.6020406, 3.378156, 1, 0, 0, 1, 1,
0.8670396, -0.3903912, 1.758443, 0, 0, 0, 1, 1,
0.8676208, -0.4356534, 0.4660711, 0, 0, 0, 1, 1,
0.8735843, -0.2228413, 1.819273, 0, 0, 0, 1, 1,
0.8756192, -1.517893, 0.2286493, 0, 0, 0, 1, 1,
0.8771291, -0.1654571, 0.9399323, 0, 0, 0, 1, 1,
0.8848057, 1.244856, -0.4316309, 0, 0, 0, 1, 1,
0.8888417, 0.1357722, 1.545592, 0, 0, 0, 1, 1,
0.8944761, 2.286588, 0.02556082, 1, 1, 1, 1, 1,
0.9016122, -0.4448182, 1.492929, 1, 1, 1, 1, 1,
0.9048229, -3.257927, 3.985366, 1, 1, 1, 1, 1,
0.9078884, -0.5312762, 2.84804, 1, 1, 1, 1, 1,
0.9088966, -0.4497738, 3.382584, 1, 1, 1, 1, 1,
0.91074, 0.4361802, 0.2588721, 1, 1, 1, 1, 1,
0.9137741, 1.361113, 0.2421194, 1, 1, 1, 1, 1,
0.9216821, 0.1529508, 0.2278524, 1, 1, 1, 1, 1,
0.9297143, -0.2101562, 3.239325, 1, 1, 1, 1, 1,
0.9335642, 1.01208, 0.7909783, 1, 1, 1, 1, 1,
0.9396176, 0.1911279, 0.4949034, 1, 1, 1, 1, 1,
0.9399267, 0.3868812, 0.09928825, 1, 1, 1, 1, 1,
0.9443877, -0.8344035, 3.075831, 1, 1, 1, 1, 1,
0.9524832, -0.0332587, -0.207314, 1, 1, 1, 1, 1,
0.9525719, 1.89032, 1.629467, 1, 1, 1, 1, 1,
0.957496, 0.06045165, 2.034234, 0, 0, 1, 1, 1,
0.9578509, 0.2776499, 2.938341, 1, 0, 0, 1, 1,
0.9605074, 0.1379843, 2.441615, 1, 0, 0, 1, 1,
0.9707134, -0.07635652, 0.8173859, 1, 0, 0, 1, 1,
0.9726159, -0.164773, 0.9113758, 1, 0, 0, 1, 1,
0.9783161, 0.6974462, 0.8416472, 1, 0, 0, 1, 1,
0.9799783, -0.2289341, 2.250709, 0, 0, 0, 1, 1,
0.9813207, 0.8391229, 2.49075, 0, 0, 0, 1, 1,
0.9834051, -0.07603923, 0.2950986, 0, 0, 0, 1, 1,
0.9892285, 0.3754445, -0.01888806, 0, 0, 0, 1, 1,
0.9916294, -0.2991602, 1.788351, 0, 0, 0, 1, 1,
0.9954497, -0.628141, 1.654778, 0, 0, 0, 1, 1,
1.009225, 0.3515159, 1.158497, 0, 0, 0, 1, 1,
1.015322, 1.315932, 1.756512, 1, 1, 1, 1, 1,
1.016494, 0.8053869, -0.1613328, 1, 1, 1, 1, 1,
1.022993, -0.6111631, 2.337029, 1, 1, 1, 1, 1,
1.024625, 0.3315751, 1.285318, 1, 1, 1, 1, 1,
1.026178, 1.261819, 1.648866, 1, 1, 1, 1, 1,
1.027268, -0.3171246, 1.640072, 1, 1, 1, 1, 1,
1.030903, 0.02055818, 1.731931, 1, 1, 1, 1, 1,
1.050046, 0.6808195, 2.640595, 1, 1, 1, 1, 1,
1.053635, 1.098979, 0.184052, 1, 1, 1, 1, 1,
1.0587, -0.9130632, 0.8183087, 1, 1, 1, 1, 1,
1.061287, 1.245134, 0.7979175, 1, 1, 1, 1, 1,
1.06132, 0.9998981, 0.15214, 1, 1, 1, 1, 1,
1.062125, 0.376265, -0.6604447, 1, 1, 1, 1, 1,
1.067911, -0.03650011, 0.282654, 1, 1, 1, 1, 1,
1.069763, 0.3181173, 0.3125172, 1, 1, 1, 1, 1,
1.072822, 0.3834904, -0.9287902, 0, 0, 1, 1, 1,
1.080244, -1.100817, 1.291566, 1, 0, 0, 1, 1,
1.085674, 0.6781452, 1.030921, 1, 0, 0, 1, 1,
1.096234, 0.2219449, 1.691602, 1, 0, 0, 1, 1,
1.098119, 1.494953, 0.7123584, 1, 0, 0, 1, 1,
1.112043, -0.7327225, 1.586616, 1, 0, 0, 1, 1,
1.116818, -0.785406, 3.315194, 0, 0, 0, 1, 1,
1.124343, 0.8992317, -0.154545, 0, 0, 0, 1, 1,
1.128606, 1.845163, 0.8188972, 0, 0, 0, 1, 1,
1.129167, 0.4130664, 1.195312, 0, 0, 0, 1, 1,
1.137054, 0.6121883, 2.092139, 0, 0, 0, 1, 1,
1.138346, -0.02601931, -0.03426278, 0, 0, 0, 1, 1,
1.140048, 0.5237395, 0.4854162, 0, 0, 0, 1, 1,
1.146552, 0.6452148, 0.698548, 1, 1, 1, 1, 1,
1.153048, -0.7149286, 2.447178, 1, 1, 1, 1, 1,
1.155552, -0.9260232, 1.423334, 1, 1, 1, 1, 1,
1.162938, 0.2411275, 1.102528, 1, 1, 1, 1, 1,
1.169773, -1.48958, 1.594917, 1, 1, 1, 1, 1,
1.171696, 0.4504099, 2.061079, 1, 1, 1, 1, 1,
1.17278, -1.149095, 1.785833, 1, 1, 1, 1, 1,
1.175033, -0.7147575, 2.242246, 1, 1, 1, 1, 1,
1.185389, -0.3155206, 1.961339, 1, 1, 1, 1, 1,
1.190429, 0.20993, 0.02150981, 1, 1, 1, 1, 1,
1.193234, 0.4703383, 1.555296, 1, 1, 1, 1, 1,
1.196878, 0.5628339, 0.2147175, 1, 1, 1, 1, 1,
1.19854, -0.4722234, 1.641665, 1, 1, 1, 1, 1,
1.205567, 1.205662, -0.8548678, 1, 1, 1, 1, 1,
1.208478, 0.3954383, -0.6312332, 1, 1, 1, 1, 1,
1.214046, 1.15188, 3.38059, 0, 0, 1, 1, 1,
1.232756, 0.5137849, 1.904099, 1, 0, 0, 1, 1,
1.239258, -0.07142165, 0.8994226, 1, 0, 0, 1, 1,
1.248996, 0.2945499, 0.07416283, 1, 0, 0, 1, 1,
1.252466, 0.3678407, 0.755266, 1, 0, 0, 1, 1,
1.256362, 0.9950647, 1.227072, 1, 0, 0, 1, 1,
1.261079, -1.976103, 4.132241, 0, 0, 0, 1, 1,
1.264675, -0.6205147, 0.8092325, 0, 0, 0, 1, 1,
1.274639, 1.830188, 1.493644, 0, 0, 0, 1, 1,
1.280143, -0.2380229, 3.040649, 0, 0, 0, 1, 1,
1.291165, 1.58738, 1.527644, 0, 0, 0, 1, 1,
1.30064, -0.5431535, 1.96031, 0, 0, 0, 1, 1,
1.302068, -0.2890788, 1.031358, 0, 0, 0, 1, 1,
1.312183, -0.3562095, 1.858747, 1, 1, 1, 1, 1,
1.315211, -2.464074, 0.3497667, 1, 1, 1, 1, 1,
1.316914, -0.528146, 3.484971, 1, 1, 1, 1, 1,
1.319424, -1.732831, 1.589971, 1, 1, 1, 1, 1,
1.320456, -0.492099, 3.102167, 1, 1, 1, 1, 1,
1.320533, 0.3047056, 0.8753319, 1, 1, 1, 1, 1,
1.323114, -0.5208393, 2.521259, 1, 1, 1, 1, 1,
1.323327, 0.1771971, 1.321392, 1, 1, 1, 1, 1,
1.33025, 0.9794188, -0.02082254, 1, 1, 1, 1, 1,
1.343486, -0.7230006, 2.602204, 1, 1, 1, 1, 1,
1.345895, -0.3278853, -0.09059903, 1, 1, 1, 1, 1,
1.359986, 0.7514609, 1.43003, 1, 1, 1, 1, 1,
1.36029, -0.8359769, 1.694036, 1, 1, 1, 1, 1,
1.367879, 0.3494096, 1.822713, 1, 1, 1, 1, 1,
1.386197, 0.8312099, 1.455428, 1, 1, 1, 1, 1,
1.405619, -0.3727653, 2.458445, 0, 0, 1, 1, 1,
1.41008, 0.8898686, 1.173973, 1, 0, 0, 1, 1,
1.414194, 1.316516, 2.043485, 1, 0, 0, 1, 1,
1.417695, 0.5648167, 0.4042368, 1, 0, 0, 1, 1,
1.441235, -0.6195807, 0.336482, 1, 0, 0, 1, 1,
1.442499, -1.153398, 3.972518, 1, 0, 0, 1, 1,
1.448738, 1.218998, 0.4809208, 0, 0, 0, 1, 1,
1.455641, 0.3209977, 3.26566, 0, 0, 0, 1, 1,
1.468974, -1.0131, 2.524089, 0, 0, 0, 1, 1,
1.470359, 0.5481341, 0.9054958, 0, 0, 0, 1, 1,
1.4824, 0.3879799, 1.406083, 0, 0, 0, 1, 1,
1.504076, -0.9166706, 1.566241, 0, 0, 0, 1, 1,
1.506436, -1.278043, 3.886371, 0, 0, 0, 1, 1,
1.534877, -0.3506683, 2.328737, 1, 1, 1, 1, 1,
1.536478, -0.5399778, 0.702334, 1, 1, 1, 1, 1,
1.557461, -2.203628, 3.02827, 1, 1, 1, 1, 1,
1.559138, -0.4577847, 1.098052, 1, 1, 1, 1, 1,
1.575839, 0.9704992, 2.772719, 1, 1, 1, 1, 1,
1.605765, -1.370015, 0.979655, 1, 1, 1, 1, 1,
1.619452, 0.4447594, 2.239509, 1, 1, 1, 1, 1,
1.621744, 0.7092294, 0.8761907, 1, 1, 1, 1, 1,
1.621883, -0.2952656, 0.7792671, 1, 1, 1, 1, 1,
1.629835, 0.6676349, 1.580692, 1, 1, 1, 1, 1,
1.632558, -0.5077709, 2.078123, 1, 1, 1, 1, 1,
1.634135, 0.8451303, 2.177869, 1, 1, 1, 1, 1,
1.65024, -0.1335709, 1.968143, 1, 1, 1, 1, 1,
1.652341, -0.02805608, 1.766022, 1, 1, 1, 1, 1,
1.652677, -0.01273972, 1.116336, 1, 1, 1, 1, 1,
1.675799, -0.4483592, 1.224683, 0, 0, 1, 1, 1,
1.68045, -0.04902001, -0.6129988, 1, 0, 0, 1, 1,
1.683678, 0.5631266, 0.4794379, 1, 0, 0, 1, 1,
1.689644, 0.566637, 1.506818, 1, 0, 0, 1, 1,
1.713234, 0.7875461, 0.4611248, 1, 0, 0, 1, 1,
1.719094, -0.5758801, 1.206981, 1, 0, 0, 1, 1,
1.753957, -1.517686, 2.386292, 0, 0, 0, 1, 1,
1.764614, 0.06902561, 2.973711, 0, 0, 0, 1, 1,
1.77136, 0.4754593, 2.650776, 0, 0, 0, 1, 1,
1.777464, -0.211797, 4.600715, 0, 0, 0, 1, 1,
1.780281, 0.5233613, 3.444763, 0, 0, 0, 1, 1,
1.782427, -1.029745, 2.579388, 0, 0, 0, 1, 1,
1.784084, 0.4737718, 1.09006, 0, 0, 0, 1, 1,
1.80365, -0.5376103, 2.68905, 1, 1, 1, 1, 1,
1.809725, -0.06867176, 1.59567, 1, 1, 1, 1, 1,
1.824334, -0.4019837, 1.197865, 1, 1, 1, 1, 1,
1.833294, 1.01598, 2.507308, 1, 1, 1, 1, 1,
1.835026, -0.02249819, 3.399231, 1, 1, 1, 1, 1,
1.89565, -0.9994966, 0.9272732, 1, 1, 1, 1, 1,
1.904784, -1.195296, 2.179204, 1, 1, 1, 1, 1,
1.944386, -1.417684, 2.952322, 1, 1, 1, 1, 1,
1.95073, 0.3399104, 2.405544, 1, 1, 1, 1, 1,
1.952513, 2.285279, 0.3858571, 1, 1, 1, 1, 1,
1.956459, 1.122403, 0.9011662, 1, 1, 1, 1, 1,
1.96947, 1.056557, 1.236806, 1, 1, 1, 1, 1,
1.97803, 1.673932, 1.061877, 1, 1, 1, 1, 1,
1.978266, 1.449182, -0.0895487, 1, 1, 1, 1, 1,
1.986094, -0.2277808, 1.135828, 1, 1, 1, 1, 1,
2.038919, 1.3688, 3.054289, 0, 0, 1, 1, 1,
2.039195, 1.063427, 1.583001, 1, 0, 0, 1, 1,
2.060535, 2.697062, 2.714769, 1, 0, 0, 1, 1,
2.095028, 1.329828, 1.622713, 1, 0, 0, 1, 1,
2.110085, 0.5264017, 0.5092533, 1, 0, 0, 1, 1,
2.115197, 0.4612476, 2.341389, 1, 0, 0, 1, 1,
2.181299, 1.491862, 1.335868, 0, 0, 0, 1, 1,
2.195158, -0.2212474, 1.40424, 0, 0, 0, 1, 1,
2.282049, -0.2914346, 2.99149, 0, 0, 0, 1, 1,
2.305526, -0.2959453, 0.109779, 0, 0, 0, 1, 1,
2.346922, -0.4953564, 0.7075821, 0, 0, 0, 1, 1,
2.511761, 0.186938, 2.563056, 0, 0, 0, 1, 1,
2.538971, 1.096847, 0.7869929, 0, 0, 0, 1, 1,
2.673924, -0.3587911, 3.441509, 1, 1, 1, 1, 1,
2.753901, 0.9317064, 0.09111562, 1, 1, 1, 1, 1,
3.150797, 1.085675, -0.1654177, 1, 1, 1, 1, 1,
3.228746, 0.1592581, 0.5434748, 1, 1, 1, 1, 1,
3.711229, -1.127063, 3.8337, 1, 1, 1, 1, 1,
3.71862, -0.6170726, 2.285767, 1, 1, 1, 1, 1,
4.094697, 1.21953, 3.160306, 1, 1, 1, 1, 1
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
var radius = 9.925545;
var distance = 34.86305;
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
mvMatrix.translate( -0.6830899, 0.2429072, 0.06721997 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.86305);
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
