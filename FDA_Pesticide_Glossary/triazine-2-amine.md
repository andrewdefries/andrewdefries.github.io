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
-3.389455, -1.092099, -2.021732, 1, 0, 0, 1,
-3.094261, 0.5411032, -2.259243, 1, 0.007843138, 0, 1,
-3.018995, 0.6662979, -1.61711, 1, 0.01176471, 0, 1,
-2.793287, 2.109954, -1.283102, 1, 0.01960784, 0, 1,
-2.779206, 1.037669, -3.838932, 1, 0.02352941, 0, 1,
-2.775585, 0.263705, -0.6210708, 1, 0.03137255, 0, 1,
-2.587501, -0.6175021, -2.415742, 1, 0.03529412, 0, 1,
-2.561856, 0.5693263, -2.683397, 1, 0.04313726, 0, 1,
-2.495764, 0.269722, -2.6022, 1, 0.04705882, 0, 1,
-2.488878, 0.4142534, -3.420766, 1, 0.05490196, 0, 1,
-2.471985, 0.4759743, -0.5842031, 1, 0.05882353, 0, 1,
-2.471717, 0.4884714, -0.9561905, 1, 0.06666667, 0, 1,
-2.39908, 0.2202321, -0.9353892, 1, 0.07058824, 0, 1,
-2.383071, 1.503085, -1.909859, 1, 0.07843138, 0, 1,
-2.342883, 0.06753943, -1.309832, 1, 0.08235294, 0, 1,
-2.321892, 1.253838, -1.808731, 1, 0.09019608, 0, 1,
-2.232759, -0.9109915, -2.756275, 1, 0.09411765, 0, 1,
-2.225224, 1.028209, -1.027891, 1, 0.1019608, 0, 1,
-2.213567, 1.050247, -2.362987, 1, 0.1098039, 0, 1,
-2.135071, 1.423903, -0.07420157, 1, 0.1137255, 0, 1,
-2.125082, 0.3876882, -1.547325, 1, 0.1215686, 0, 1,
-2.086173, -0.5928185, -1.767591, 1, 0.1254902, 0, 1,
-2.040915, 0.805562, 0.158027, 1, 0.1333333, 0, 1,
-2.016177, -1.899217, -2.268442, 1, 0.1372549, 0, 1,
-2.006459, -0.05134614, -1.144709, 1, 0.145098, 0, 1,
-2.004691, 0.4016999, -1.045677, 1, 0.1490196, 0, 1,
-1.998478, 0.129749, -1.569253, 1, 0.1568628, 0, 1,
-1.957577, 0.6539222, 0.1042422, 1, 0.1607843, 0, 1,
-1.950327, -0.1683539, -1.171524, 1, 0.1686275, 0, 1,
-1.936904, -0.8538495, -1.843305, 1, 0.172549, 0, 1,
-1.917737, 0.2047526, -1.34126, 1, 0.1803922, 0, 1,
-1.913008, 0.2634937, -1.938471, 1, 0.1843137, 0, 1,
-1.906704, 1.216612, -1.455491, 1, 0.1921569, 0, 1,
-1.887201, 0.4014547, -0.9393007, 1, 0.1960784, 0, 1,
-1.879851, -0.1878893, -0.9896525, 1, 0.2039216, 0, 1,
-1.873259, 0.5945509, -0.3789623, 1, 0.2117647, 0, 1,
-1.844293, 0.1738908, -0.7696903, 1, 0.2156863, 0, 1,
-1.84078, 0.1228688, -0.487725, 1, 0.2235294, 0, 1,
-1.825657, 1.237257, -0.1099725, 1, 0.227451, 0, 1,
-1.82003, 1.409234, -0.9444256, 1, 0.2352941, 0, 1,
-1.76569, -0.2056746, -1.777729, 1, 0.2392157, 0, 1,
-1.74118, -0.2613699, -2.237325, 1, 0.2470588, 0, 1,
-1.738195, -0.1881149, -1.974378, 1, 0.2509804, 0, 1,
-1.732881, -0.3593293, -2.35381, 1, 0.2588235, 0, 1,
-1.721484, 0.03485649, -1.153964, 1, 0.2627451, 0, 1,
-1.70631, -1.454665, -1.879105, 1, 0.2705882, 0, 1,
-1.694051, 0.8700718, -0.6020687, 1, 0.2745098, 0, 1,
-1.690971, -1.135516, -0.153375, 1, 0.282353, 0, 1,
-1.689504, -0.2025967, -1.860481, 1, 0.2862745, 0, 1,
-1.683794, -0.3259449, -0.9843865, 1, 0.2941177, 0, 1,
-1.680291, -0.5859583, -1.077281, 1, 0.3019608, 0, 1,
-1.659545, 0.2140412, -0.9373342, 1, 0.3058824, 0, 1,
-1.658379, 0.5480716, -1.042939, 1, 0.3137255, 0, 1,
-1.655253, -0.747463, -1.834625, 1, 0.3176471, 0, 1,
-1.649021, 0.06204667, 1.35904, 1, 0.3254902, 0, 1,
-1.645191, -0.1265131, 0.7160779, 1, 0.3294118, 0, 1,
-1.641811, -0.296468, -2.859804, 1, 0.3372549, 0, 1,
-1.6024, 1.413061, -3.019329, 1, 0.3411765, 0, 1,
-1.599863, -0.5069349, -3.280261, 1, 0.3490196, 0, 1,
-1.597011, -0.9180905, -1.695342, 1, 0.3529412, 0, 1,
-1.596098, -0.640993, -1.840151, 1, 0.3607843, 0, 1,
-1.583617, 1.43321, -1.66471, 1, 0.3647059, 0, 1,
-1.580347, -1.192439, -1.449659, 1, 0.372549, 0, 1,
-1.577291, 1.070864, -0.306019, 1, 0.3764706, 0, 1,
-1.569314, 1.34738, 0.01466541, 1, 0.3843137, 0, 1,
-1.54512, -0.7475956, -1.534881, 1, 0.3882353, 0, 1,
-1.533202, -0.4557365, -2.148697, 1, 0.3960784, 0, 1,
-1.528907, 0.8179566, 1.3086, 1, 0.4039216, 0, 1,
-1.515191, -1.321835, -2.971199, 1, 0.4078431, 0, 1,
-1.513048, 0.2947943, -1.931333, 1, 0.4156863, 0, 1,
-1.509864, -1.323499, -0.4145715, 1, 0.4196078, 0, 1,
-1.507815, -0.07764049, 0.1707432, 1, 0.427451, 0, 1,
-1.501502, -0.2698147, -2.43241, 1, 0.4313726, 0, 1,
-1.488885, 0.0005592898, -1.531422, 1, 0.4392157, 0, 1,
-1.479496, -1.690356, -2.675468, 1, 0.4431373, 0, 1,
-1.478881, -0.7056224, -2.410377, 1, 0.4509804, 0, 1,
-1.43286, 0.2518575, -0.4737995, 1, 0.454902, 0, 1,
-1.42557, 1.701244, -3.814117, 1, 0.4627451, 0, 1,
-1.406251, -0.391789, -2.224417, 1, 0.4666667, 0, 1,
-1.402306, 1.473121, -2.247829, 1, 0.4745098, 0, 1,
-1.391446, -0.689946, -1.909495, 1, 0.4784314, 0, 1,
-1.379681, -1.328301, -3.435053, 1, 0.4862745, 0, 1,
-1.378065, -2.763633, -3.229777, 1, 0.4901961, 0, 1,
-1.361027, 1.539391, -2.20552, 1, 0.4980392, 0, 1,
-1.358155, -0.5183222, -2.134134, 1, 0.5058824, 0, 1,
-1.352838, -1.529442, -1.597126, 1, 0.509804, 0, 1,
-1.349643, 0.4446931, -3.656561, 1, 0.5176471, 0, 1,
-1.348773, 0.2785679, -0.8545991, 1, 0.5215687, 0, 1,
-1.341824, -0.4608428, -1.086393, 1, 0.5294118, 0, 1,
-1.336694, -0.6949168, -2.564553, 1, 0.5333334, 0, 1,
-1.336308, -0.646543, -2.693935, 1, 0.5411765, 0, 1,
-1.332857, 0.1173202, -0.5085279, 1, 0.5450981, 0, 1,
-1.332166, 2.160677, 0.4688195, 1, 0.5529412, 0, 1,
-1.329504, -0.90745, -0.4087441, 1, 0.5568628, 0, 1,
-1.327361, -1.508349, -3.811399, 1, 0.5647059, 0, 1,
-1.324206, 1.721448, -0.7890137, 1, 0.5686275, 0, 1,
-1.320657, 0.08190638, -2.809932, 1, 0.5764706, 0, 1,
-1.31894, -0.1091317, -0.9992048, 1, 0.5803922, 0, 1,
-1.307245, 0.1660831, -3.935616, 1, 0.5882353, 0, 1,
-1.305052, -1.342248, -4.23103, 1, 0.5921569, 0, 1,
-1.292448, -1.574161, -3.198935, 1, 0.6, 0, 1,
-1.291072, -1.032687, -2.671752, 1, 0.6078432, 0, 1,
-1.286482, 0.7097692, -0.6794401, 1, 0.6117647, 0, 1,
-1.281068, -0.547604, -0.4506167, 1, 0.6196079, 0, 1,
-1.269244, -2.570627, -3.257068, 1, 0.6235294, 0, 1,
-1.269077, -0.0249706, -1.419099, 1, 0.6313726, 0, 1,
-1.257595, 0.4848808, 1.093369, 1, 0.6352941, 0, 1,
-1.252986, 1.187255, -0.7667675, 1, 0.6431373, 0, 1,
-1.247344, 0.4490502, -0.2198821, 1, 0.6470588, 0, 1,
-1.238474, 0.7699322, -2.337283, 1, 0.654902, 0, 1,
-1.220376, 1.289452, -2.122917, 1, 0.6588235, 0, 1,
-1.219775, -2.113154, -2.252767, 1, 0.6666667, 0, 1,
-1.215708, 0.9897485, -0.1469341, 1, 0.6705883, 0, 1,
-1.208201, 0.7832162, -0.2390162, 1, 0.6784314, 0, 1,
-1.207523, 0.9935391, 1.071738, 1, 0.682353, 0, 1,
-1.202737, 1.477479, -1.601203, 1, 0.6901961, 0, 1,
-1.201972, 0.08548498, -1.964976, 1, 0.6941177, 0, 1,
-1.199083, 0.287685, -3.501495, 1, 0.7019608, 0, 1,
-1.198534, -1.076061, -0.3248401, 1, 0.7098039, 0, 1,
-1.193212, 0.606062, -1.010383, 1, 0.7137255, 0, 1,
-1.193052, 1.414386, -0.8310036, 1, 0.7215686, 0, 1,
-1.192839, -1.039609, -3.760222, 1, 0.7254902, 0, 1,
-1.190432, -0.1836634, -2.673707, 1, 0.7333333, 0, 1,
-1.183317, 1.341724, 0.8800981, 1, 0.7372549, 0, 1,
-1.17873, 0.706237, -1.752658, 1, 0.7450981, 0, 1,
-1.175122, -0.8574036, -4.313013, 1, 0.7490196, 0, 1,
-1.171106, -0.5458296, -0.7849414, 1, 0.7568628, 0, 1,
-1.15952, 1.505795, 0.7309583, 1, 0.7607843, 0, 1,
-1.159468, 1.496953, -2.343072, 1, 0.7686275, 0, 1,
-1.158362, -0.5819853, -1.677946, 1, 0.772549, 0, 1,
-1.156102, 0.3535848, -3.096294, 1, 0.7803922, 0, 1,
-1.15428, 0.2970303, -0.06431024, 1, 0.7843137, 0, 1,
-1.153877, 0.3973215, -1.855441, 1, 0.7921569, 0, 1,
-1.149067, -1.821417, -4.499355, 1, 0.7960784, 0, 1,
-1.139304, 1.446211, 0.9515232, 1, 0.8039216, 0, 1,
-1.13792, -1.173362, -1.948367, 1, 0.8117647, 0, 1,
-1.132536, 1.422896, -2.963371, 1, 0.8156863, 0, 1,
-1.131693, 1.130418, -0.8726268, 1, 0.8235294, 0, 1,
-1.128672, -0.855232, -2.174066, 1, 0.827451, 0, 1,
-1.114769, -0.2232483, -2.942425, 1, 0.8352941, 0, 1,
-1.109164, -0.7194582, -1.744098, 1, 0.8392157, 0, 1,
-1.106306, -0.3161497, -2.624018, 1, 0.8470588, 0, 1,
-1.091933, 0.4498587, -1.699522, 1, 0.8509804, 0, 1,
-1.091361, -1.084956, -2.624833, 1, 0.8588235, 0, 1,
-1.086187, -0.5277209, -1.521713, 1, 0.8627451, 0, 1,
-1.085552, 0.4311229, -3.307168, 1, 0.8705882, 0, 1,
-1.074759, -0.1758471, -2.084417, 1, 0.8745098, 0, 1,
-1.070148, -0.4869244, -2.765295, 1, 0.8823529, 0, 1,
-1.069922, 0.4382958, -1.775202, 1, 0.8862745, 0, 1,
-1.056735, -0.7561306, -3.229892, 1, 0.8941177, 0, 1,
-1.055934, -1.659072, -1.887023, 1, 0.8980392, 0, 1,
-1.055671, -0.3304968, -2.621826, 1, 0.9058824, 0, 1,
-1.054596, 0.1172724, -2.839276, 1, 0.9137255, 0, 1,
-1.040241, -1.732247, 0.07621279, 1, 0.9176471, 0, 1,
-1.035789, -1.604251, -2.569221, 1, 0.9254902, 0, 1,
-1.033565, -0.231181, -1.001771, 1, 0.9294118, 0, 1,
-1.030462, 1.573395, 0.3864075, 1, 0.9372549, 0, 1,
-1.030429, 0.4219939, -0.174651, 1, 0.9411765, 0, 1,
-1.028768, 0.3391466, -2.535103, 1, 0.9490196, 0, 1,
-1.021776, -0.9581655, -2.138836, 1, 0.9529412, 0, 1,
-1.014056, 0.7482224, -0.1249707, 1, 0.9607843, 0, 1,
-1.013013, -0.3949823, -3.019459, 1, 0.9647059, 0, 1,
-1.009699, -0.2909832, -0.6637369, 1, 0.972549, 0, 1,
-1.009537, -1.000534, -3.993247, 1, 0.9764706, 0, 1,
-1.006702, -0.06428532, -2.756905, 1, 0.9843137, 0, 1,
-1.005942, -0.152015, -0.5513635, 1, 0.9882353, 0, 1,
-1.004654, -0.4785584, -2.392905, 1, 0.9960784, 0, 1,
-1.000662, 1.239183, -1.642208, 0.9960784, 1, 0, 1,
-0.9943175, -0.06817146, -0.3970862, 0.9921569, 1, 0, 1,
-0.99327, -0.1752939, -1.371037, 0.9843137, 1, 0, 1,
-0.9930472, 0.5474623, -0.2577899, 0.9803922, 1, 0, 1,
-0.9901291, -0.4734338, -2.872995, 0.972549, 1, 0, 1,
-0.9833903, -1.368909, -2.361927, 0.9686275, 1, 0, 1,
-0.9827346, -0.5695461, -2.265463, 0.9607843, 1, 0, 1,
-0.9713203, -2.241034, -2.284574, 0.9568627, 1, 0, 1,
-0.9653876, -1.617411, -3.721135, 0.9490196, 1, 0, 1,
-0.9573218, 1.222642, 0.9955282, 0.945098, 1, 0, 1,
-0.9568831, -0.01968526, -2.606128, 0.9372549, 1, 0, 1,
-0.9556537, 0.2872546, -0.3583391, 0.9333333, 1, 0, 1,
-0.9520217, 1.332311, -1.472171, 0.9254902, 1, 0, 1,
-0.9490347, -3.068553, -3.9691, 0.9215686, 1, 0, 1,
-0.9475697, 1.317848, -0.8254246, 0.9137255, 1, 0, 1,
-0.9358337, 1.23717, -0.6502908, 0.9098039, 1, 0, 1,
-0.9329243, 0.7010214, 1.075966, 0.9019608, 1, 0, 1,
-0.9325812, 0.1528577, -1.228912, 0.8941177, 1, 0, 1,
-0.9319628, 0.1249572, -1.32229, 0.8901961, 1, 0, 1,
-0.9280282, 0.2804326, -0.8340061, 0.8823529, 1, 0, 1,
-0.9256973, -0.3040744, -3.945389, 0.8784314, 1, 0, 1,
-0.910857, 0.5207579, 0.8762278, 0.8705882, 1, 0, 1,
-0.908471, -0.5869113, -4.14743, 0.8666667, 1, 0, 1,
-0.9078733, 1.75241, -2.103065, 0.8588235, 1, 0, 1,
-0.9040654, -1.272553, -2.628053, 0.854902, 1, 0, 1,
-0.9033576, 0.1372127, -3.8303, 0.8470588, 1, 0, 1,
-0.9010622, -0.3582674, -3.627124, 0.8431373, 1, 0, 1,
-0.8993399, -0.2268897, -0.4911557, 0.8352941, 1, 0, 1,
-0.8992141, -0.4914804, -4.205438, 0.8313726, 1, 0, 1,
-0.8944782, 0.6641774, -0.02915463, 0.8235294, 1, 0, 1,
-0.8933588, -0.1453581, -2.000302, 0.8196079, 1, 0, 1,
-0.8717285, 1.163328, -0.5201132, 0.8117647, 1, 0, 1,
-0.8635235, 1.438794, -0.1852375, 0.8078431, 1, 0, 1,
-0.8598264, -0.3966607, -2.970978, 0.8, 1, 0, 1,
-0.8598128, -0.5593033, -3.908299, 0.7921569, 1, 0, 1,
-0.8469685, -0.6632825, -2.337626, 0.7882353, 1, 0, 1,
-0.8436275, 1.043055, -1.13114, 0.7803922, 1, 0, 1,
-0.8429349, 1.229998, 0.2431794, 0.7764706, 1, 0, 1,
-0.841614, 0.1689347, -1.656068, 0.7686275, 1, 0, 1,
-0.8413305, 2.135272, -0.1652463, 0.7647059, 1, 0, 1,
-0.8350455, 0.2332144, -0.6057356, 0.7568628, 1, 0, 1,
-0.830103, 0.6724943, -0.7412689, 0.7529412, 1, 0, 1,
-0.8263032, -1.223452, -3.782831, 0.7450981, 1, 0, 1,
-0.8249902, 0.01088638, -1.927235, 0.7411765, 1, 0, 1,
-0.822551, 0.1886577, -0.8081776, 0.7333333, 1, 0, 1,
-0.8174543, 1.74754, 0.4896032, 0.7294118, 1, 0, 1,
-0.8163826, -1.873133, -3.399987, 0.7215686, 1, 0, 1,
-0.8065786, -0.4661511, -1.831085, 0.7176471, 1, 0, 1,
-0.7942171, 0.3054328, -0.08703202, 0.7098039, 1, 0, 1,
-0.7925928, 2.105707, -2.074352, 0.7058824, 1, 0, 1,
-0.7920766, -0.5134866, -3.551473, 0.6980392, 1, 0, 1,
-0.7912761, 3.126647, -1.288883, 0.6901961, 1, 0, 1,
-0.7902469, 0.1342352, -0.9430136, 0.6862745, 1, 0, 1,
-0.7870784, 0.1566541, -2.100835, 0.6784314, 1, 0, 1,
-0.786365, -0.7984185, -2.225489, 0.6745098, 1, 0, 1,
-0.7827853, -0.5835764, -2.786569, 0.6666667, 1, 0, 1,
-0.7748042, 1.18528, -0.3994576, 0.6627451, 1, 0, 1,
-0.7614255, 0.04525808, -0.4367712, 0.654902, 1, 0, 1,
-0.7517669, 0.06503578, 0.7170358, 0.6509804, 1, 0, 1,
-0.7501574, -0.3735912, -2.318805, 0.6431373, 1, 0, 1,
-0.7485285, 0.3734146, -0.4805928, 0.6392157, 1, 0, 1,
-0.7463239, -1.989086, -2.773423, 0.6313726, 1, 0, 1,
-0.746069, -0.5876592, -1.813023, 0.627451, 1, 0, 1,
-0.7455794, -0.3327282, -3.13292, 0.6196079, 1, 0, 1,
-0.745108, -0.9922121, -2.441385, 0.6156863, 1, 0, 1,
-0.7444959, -1.635706, -3.294996, 0.6078432, 1, 0, 1,
-0.7387465, -0.2797534, -0.6325493, 0.6039216, 1, 0, 1,
-0.7210705, -1.141726, -2.927757, 0.5960785, 1, 0, 1,
-0.7192086, -0.5254, -1.21611, 0.5882353, 1, 0, 1,
-0.7124794, 1.112574, 0.6773705, 0.5843138, 1, 0, 1,
-0.7123575, -0.8642842, -0.8812029, 0.5764706, 1, 0, 1,
-0.7096146, -0.08809379, -2.443976, 0.572549, 1, 0, 1,
-0.7062904, -0.6334856, -1.900953, 0.5647059, 1, 0, 1,
-0.7043623, 1.267227, -0.2203251, 0.5607843, 1, 0, 1,
-0.7007307, -0.7298989, -5.107971, 0.5529412, 1, 0, 1,
-0.6975231, -0.3279787, -0.8499969, 0.5490196, 1, 0, 1,
-0.6970174, 1.967597, -0.8910245, 0.5411765, 1, 0, 1,
-0.696634, -0.6770374, -3.325317, 0.5372549, 1, 0, 1,
-0.6948276, -0.9308794, -2.523407, 0.5294118, 1, 0, 1,
-0.6909515, 1.854543, -0.1230121, 0.5254902, 1, 0, 1,
-0.6907195, -0.6154606, -2.021051, 0.5176471, 1, 0, 1,
-0.6838673, 0.4469287, -2.413264, 0.5137255, 1, 0, 1,
-0.6827409, -0.1229034, -2.77455, 0.5058824, 1, 0, 1,
-0.67838, -0.8610437, -3.420135, 0.5019608, 1, 0, 1,
-0.6780627, 0.1288912, -0.1458919, 0.4941176, 1, 0, 1,
-0.6750045, 0.2853629, -1.764006, 0.4862745, 1, 0, 1,
-0.6738837, 0.5686045, 0.8019384, 0.4823529, 1, 0, 1,
-0.6736584, 0.04466241, -3.033795, 0.4745098, 1, 0, 1,
-0.6662767, -0.1247191, -1.473323, 0.4705882, 1, 0, 1,
-0.6626699, -1.611261, -2.388654, 0.4627451, 1, 0, 1,
-0.6626237, -0.3049271, -2.75871, 0.4588235, 1, 0, 1,
-0.6617981, 0.7429882, -1.284178, 0.4509804, 1, 0, 1,
-0.6541689, 0.009283319, -0.7174146, 0.4470588, 1, 0, 1,
-0.6536438, -2.036364, -2.730565, 0.4392157, 1, 0, 1,
-0.6531712, 0.7934392, -0.730239, 0.4352941, 1, 0, 1,
-0.6483694, -0.2740284, -1.553948, 0.427451, 1, 0, 1,
-0.6459875, -0.5013235, -2.762994, 0.4235294, 1, 0, 1,
-0.6393951, -0.1437377, -1.080309, 0.4156863, 1, 0, 1,
-0.6378461, 2.050147, -0.5126867, 0.4117647, 1, 0, 1,
-0.637108, -1.658735, -4.559729, 0.4039216, 1, 0, 1,
-0.6318961, -0.4893843, -2.234239, 0.3960784, 1, 0, 1,
-0.6307337, 0.8668099, 0.5801377, 0.3921569, 1, 0, 1,
-0.6296838, -1.904307, -2.465554, 0.3843137, 1, 0, 1,
-0.6206561, 1.552787, 0.7802337, 0.3803922, 1, 0, 1,
-0.6191332, 1.000202, -0.8723781, 0.372549, 1, 0, 1,
-0.6111345, -0.8517556, -2.205287, 0.3686275, 1, 0, 1,
-0.6103471, -1.020292, -4.397562, 0.3607843, 1, 0, 1,
-0.6084681, -0.03782244, -1.383699, 0.3568628, 1, 0, 1,
-0.6082721, -1.820541, -1.881964, 0.3490196, 1, 0, 1,
-0.6060064, 0.1725696, -3.073009, 0.345098, 1, 0, 1,
-0.6030777, -1.220792, -1.875837, 0.3372549, 1, 0, 1,
-0.5961909, -1.165878, -2.984398, 0.3333333, 1, 0, 1,
-0.5926964, -0.9350573, -4.251345, 0.3254902, 1, 0, 1,
-0.592362, 0.8988826, 0.3487647, 0.3215686, 1, 0, 1,
-0.5845744, 1.069197, -0.05819371, 0.3137255, 1, 0, 1,
-0.5812206, 0.4503932, -1.952624, 0.3098039, 1, 0, 1,
-0.5736232, 0.9666522, -0.7854425, 0.3019608, 1, 0, 1,
-0.5684321, 0.3578099, -1.478455, 0.2941177, 1, 0, 1,
-0.5628124, 1.469067, 1.223944, 0.2901961, 1, 0, 1,
-0.5439375, -0.4329383, -1.892612, 0.282353, 1, 0, 1,
-0.5436358, 0.09806799, -3.625621, 0.2784314, 1, 0, 1,
-0.5386952, -1.077265, -1.915233, 0.2705882, 1, 0, 1,
-0.5283366, -0.5662311, -3.77065, 0.2666667, 1, 0, 1,
-0.5208703, -0.5082232, -1.649291, 0.2588235, 1, 0, 1,
-0.5200129, -0.3155089, -2.227189, 0.254902, 1, 0, 1,
-0.515543, -0.2305163, -2.156461, 0.2470588, 1, 0, 1,
-0.510345, -0.07005207, -2.636635, 0.2431373, 1, 0, 1,
-0.5091342, 0.4372921, 0.4460545, 0.2352941, 1, 0, 1,
-0.5061112, 0.7552261, -0.3360261, 0.2313726, 1, 0, 1,
-0.5026594, 0.07370125, -2.521675, 0.2235294, 1, 0, 1,
-0.5005268, -0.5299671, -1.989606, 0.2196078, 1, 0, 1,
-0.4989504, 0.0406144, -1.80425, 0.2117647, 1, 0, 1,
-0.498016, 0.8749773, 0.3437487, 0.2078431, 1, 0, 1,
-0.4967458, 1.177565, -0.03347719, 0.2, 1, 0, 1,
-0.4951647, -0.9890999, -2.602567, 0.1921569, 1, 0, 1,
-0.4856738, -0.002299431, -1.263066, 0.1882353, 1, 0, 1,
-0.4785335, -0.9166287, -3.136631, 0.1803922, 1, 0, 1,
-0.4750223, 1.024071, -1.164812, 0.1764706, 1, 0, 1,
-0.4742549, -1.735755, -4.043925, 0.1686275, 1, 0, 1,
-0.4703234, 1.10633, 1.47766, 0.1647059, 1, 0, 1,
-0.4701923, 2.378267, -1.043503, 0.1568628, 1, 0, 1,
-0.4689288, 0.4059608, -0.8921131, 0.1529412, 1, 0, 1,
-0.4637971, 1.154765, 1.998723, 0.145098, 1, 0, 1,
-0.4609303, -0.1457535, -2.439611, 0.1411765, 1, 0, 1,
-0.4524592, 0.1313916, -1.829872, 0.1333333, 1, 0, 1,
-0.4493415, 0.4105972, 0.190211, 0.1294118, 1, 0, 1,
-0.4491469, -0.1968047, -1.010088, 0.1215686, 1, 0, 1,
-0.4490787, -0.420877, -2.100238, 0.1176471, 1, 0, 1,
-0.4484, 0.1657037, -1.293386, 0.1098039, 1, 0, 1,
-0.4473864, -0.6238443, -2.982007, 0.1058824, 1, 0, 1,
-0.4418113, -0.6347675, -3.187168, 0.09803922, 1, 0, 1,
-0.4413448, 0.9384824, -0.7094889, 0.09019608, 1, 0, 1,
-0.4400254, -1.437384, -1.82311, 0.08627451, 1, 0, 1,
-0.4373423, -1.703091, -1.765192, 0.07843138, 1, 0, 1,
-0.4354236, 0.1387124, -1.449412, 0.07450981, 1, 0, 1,
-0.4317364, 0.4860327, -0.6147204, 0.06666667, 1, 0, 1,
-0.4311694, -0.4579789, -3.304209, 0.0627451, 1, 0, 1,
-0.4302221, -1.690597, -1.446479, 0.05490196, 1, 0, 1,
-0.4292569, 0.3546671, -0.4431715, 0.05098039, 1, 0, 1,
-0.427737, 0.702379, -0.7492411, 0.04313726, 1, 0, 1,
-0.4264722, -0.4554691, -2.730728, 0.03921569, 1, 0, 1,
-0.4241833, 0.5020239, -0.9122428, 0.03137255, 1, 0, 1,
-0.4230105, 0.1225525, -0.8974535, 0.02745098, 1, 0, 1,
-0.4223954, 0.1887169, -1.502989, 0.01960784, 1, 0, 1,
-0.4137866, -0.4692398, -2.002323, 0.01568628, 1, 0, 1,
-0.4079513, 0.9932085, -0.3759007, 0.007843138, 1, 0, 1,
-0.4020985, -1.525288, -2.169785, 0.003921569, 1, 0, 1,
-0.3967823, -0.8004603, -3.603329, 0, 1, 0.003921569, 1,
-0.395532, 1.179198, -1.364668, 0, 1, 0.01176471, 1,
-0.3925897, -0.9352466, -2.511331, 0, 1, 0.01568628, 1,
-0.3887814, -0.9852395, -3.5212, 0, 1, 0.02352941, 1,
-0.3887675, 0.0597821, -1.8773, 0, 1, 0.02745098, 1,
-0.3858969, -0.2686489, -1.648773, 0, 1, 0.03529412, 1,
-0.3825633, 0.3919643, -1.328725, 0, 1, 0.03921569, 1,
-0.3822357, -1.339869, -1.77002, 0, 1, 0.04705882, 1,
-0.3808722, -0.9795738, -2.454144, 0, 1, 0.05098039, 1,
-0.3750179, -0.8212349, -2.481849, 0, 1, 0.05882353, 1,
-0.3663468, 0.1783652, 0.03758061, 0, 1, 0.0627451, 1,
-0.3659791, -0.9335486, -4.739387, 0, 1, 0.07058824, 1,
-0.3623255, -0.9328191, -2.730951, 0, 1, 0.07450981, 1,
-0.3619847, -0.1332454, -3.261099, 0, 1, 0.08235294, 1,
-0.3619839, -0.3255705, -1.605338, 0, 1, 0.08627451, 1,
-0.3562134, 0.3276847, -0.217052, 0, 1, 0.09411765, 1,
-0.3550618, 0.7554991, -0.2253068, 0, 1, 0.1019608, 1,
-0.3542683, -0.1264801, -2.603366, 0, 1, 0.1058824, 1,
-0.3509316, -1.819952, -4.144493, 0, 1, 0.1137255, 1,
-0.349489, 0.4512909, -0.3743589, 0, 1, 0.1176471, 1,
-0.3482006, -0.1091635, -1.672104, 0, 1, 0.1254902, 1,
-0.3473464, 0.8926015, 0.5967937, 0, 1, 0.1294118, 1,
-0.3469879, -0.3084432, -1.113769, 0, 1, 0.1372549, 1,
-0.3442861, 0.08495029, -0.9682847, 0, 1, 0.1411765, 1,
-0.3414706, -0.04593509, -2.803514, 0, 1, 0.1490196, 1,
-0.3392515, -1.364511, -2.550122, 0, 1, 0.1529412, 1,
-0.3377018, -0.178476, -2.806038, 0, 1, 0.1607843, 1,
-0.3355643, -0.6648775, -3.442187, 0, 1, 0.1647059, 1,
-0.3331384, 1.6946, 0.2804559, 0, 1, 0.172549, 1,
-0.3322333, 0.43669, 0.2439212, 0, 1, 0.1764706, 1,
-0.3305111, -1.255183, -5.1156, 0, 1, 0.1843137, 1,
-0.3263496, 0.4011331, -0.8147537, 0, 1, 0.1882353, 1,
-0.3254595, -0.7543044, -1.185369, 0, 1, 0.1960784, 1,
-0.3233078, 0.1173096, -2.10955, 0, 1, 0.2039216, 1,
-0.3219295, -1.808149, -4.482193, 0, 1, 0.2078431, 1,
-0.3190636, 2.751238, 0.4481156, 0, 1, 0.2156863, 1,
-0.318535, -0.3388014, -0.5332214, 0, 1, 0.2196078, 1,
-0.3166533, 0.2999508, -1.729392, 0, 1, 0.227451, 1,
-0.3134668, -1.589721, -2.81125, 0, 1, 0.2313726, 1,
-0.3119334, 0.2759954, -0.5467799, 0, 1, 0.2392157, 1,
-0.3088146, -0.2075593, -2.247232, 0, 1, 0.2431373, 1,
-0.3039423, 0.3362711, -1.302681, 0, 1, 0.2509804, 1,
-0.3025804, -0.9626906, -2.759633, 0, 1, 0.254902, 1,
-0.2974898, -0.4033786, -3.961899, 0, 1, 0.2627451, 1,
-0.2963307, -0.211887, -2.361494, 0, 1, 0.2666667, 1,
-0.2957373, -0.009750253, -1.151614, 0, 1, 0.2745098, 1,
-0.2942231, 1.265406, 0.08231711, 0, 1, 0.2784314, 1,
-0.2883356, 0.9095421, 1.899604, 0, 1, 0.2862745, 1,
-0.2864209, -1.426368, -3.069774, 0, 1, 0.2901961, 1,
-0.2855127, 0.8004716, -0.1856469, 0, 1, 0.2980392, 1,
-0.2836002, -0.7609241, -1.352191, 0, 1, 0.3058824, 1,
-0.2822222, 1.200809, 0.3703333, 0, 1, 0.3098039, 1,
-0.2781765, 0.7079203, -1.154028, 0, 1, 0.3176471, 1,
-0.2770873, 0.07880086, -0.09466308, 0, 1, 0.3215686, 1,
-0.2749648, 0.3110639, -0.7777317, 0, 1, 0.3294118, 1,
-0.2743526, 0.08541299, -0.8795385, 0, 1, 0.3333333, 1,
-0.273736, -1.524927, -3.8556, 0, 1, 0.3411765, 1,
-0.2735295, -0.8324794, -2.695598, 0, 1, 0.345098, 1,
-0.2722735, 0.3421903, -0.6588715, 0, 1, 0.3529412, 1,
-0.2709557, 0.8870052, -1.279654, 0, 1, 0.3568628, 1,
-0.2679054, -1.317819, -1.901555, 0, 1, 0.3647059, 1,
-0.2659506, -1.008159, -2.842125, 0, 1, 0.3686275, 1,
-0.264965, 0.7252909, -1.542661, 0, 1, 0.3764706, 1,
-0.264359, 0.4912463, 0.9654653, 0, 1, 0.3803922, 1,
-0.2642217, -0.3468261, -2.806206, 0, 1, 0.3882353, 1,
-0.2609358, 0.6852872, -1.016317, 0, 1, 0.3921569, 1,
-0.2584835, 0.2994697, -0.9442961, 0, 1, 0.4, 1,
-0.2543046, 1.084142, -0.5841066, 0, 1, 0.4078431, 1,
-0.2539949, 0.1863522, -1.755913, 0, 1, 0.4117647, 1,
-0.2499646, 0.3331665, 1.648564, 0, 1, 0.4196078, 1,
-0.2497464, -0.1134556, -2.621167, 0, 1, 0.4235294, 1,
-0.2490618, 1.211523, -1.708447, 0, 1, 0.4313726, 1,
-0.2447469, -0.5121965, -2.526625, 0, 1, 0.4352941, 1,
-0.2434933, -0.5151506, -3.499238, 0, 1, 0.4431373, 1,
-0.2403287, 0.3692278, 0.6115971, 0, 1, 0.4470588, 1,
-0.2358838, -0.2285226, -1.597236, 0, 1, 0.454902, 1,
-0.2293334, -2.27016, -1.062921, 0, 1, 0.4588235, 1,
-0.228918, 0.867343, -1.283568, 0, 1, 0.4666667, 1,
-0.2261432, 1.319673, 1.951579, 0, 1, 0.4705882, 1,
-0.2260122, 1.368491, -0.6588118, 0, 1, 0.4784314, 1,
-0.2252618, 1.648679, 0.9048089, 0, 1, 0.4823529, 1,
-0.2244386, 0.1636732, 0.1494647, 0, 1, 0.4901961, 1,
-0.2230807, 0.7448317, -1.019743, 0, 1, 0.4941176, 1,
-0.2216861, 0.268446, -1.609312, 0, 1, 0.5019608, 1,
-0.217792, -1.153043, -1.921439, 0, 1, 0.509804, 1,
-0.2153543, 0.5686808, 1.000547, 0, 1, 0.5137255, 1,
-0.2152514, -0.9159542, -2.898017, 0, 1, 0.5215687, 1,
-0.2151039, -1.1022, -2.807992, 0, 1, 0.5254902, 1,
-0.2147458, -0.4193774, -3.160119, 0, 1, 0.5333334, 1,
-0.2108356, 0.6177683, 0.09389499, 0, 1, 0.5372549, 1,
-0.208654, -0.5376382, -2.284786, 0, 1, 0.5450981, 1,
-0.2062828, 0.9887021, 1.194112, 0, 1, 0.5490196, 1,
-0.2025788, -0.03090576, -2.094305, 0, 1, 0.5568628, 1,
-0.1973516, 2.295328, 0.6728595, 0, 1, 0.5607843, 1,
-0.1962778, 1.085647, -0.6407387, 0, 1, 0.5686275, 1,
-0.1956191, 0.1126425, -1.996147, 0, 1, 0.572549, 1,
-0.1908868, -0.02425425, -1.799933, 0, 1, 0.5803922, 1,
-0.1890924, 0.03905758, -0.335356, 0, 1, 0.5843138, 1,
-0.1869645, -2.01353, -2.014405, 0, 1, 0.5921569, 1,
-0.1863651, 1.925092, 1.583406, 0, 1, 0.5960785, 1,
-0.1820896, -0.7289256, -1.905294, 0, 1, 0.6039216, 1,
-0.1814972, 1.159771, -0.3332429, 0, 1, 0.6117647, 1,
-0.1807099, 0.2197527, -3.343708, 0, 1, 0.6156863, 1,
-0.1787345, 0.1040594, -2.565466, 0, 1, 0.6235294, 1,
-0.1785503, -0.2680625, -1.953551, 0, 1, 0.627451, 1,
-0.1764583, 0.3410775, -0.576497, 0, 1, 0.6352941, 1,
-0.1738145, -1.724562, -2.734502, 0, 1, 0.6392157, 1,
-0.1722176, -0.1921055, -3.197492, 0, 1, 0.6470588, 1,
-0.1650819, -1.399018, -4.377819, 0, 1, 0.6509804, 1,
-0.159523, 0.5568056, 0.8810958, 0, 1, 0.6588235, 1,
-0.1575832, 0.2753658, -2.207747, 0, 1, 0.6627451, 1,
-0.1553289, -0.4015162, -2.923332, 0, 1, 0.6705883, 1,
-0.1493789, 2.359998, -1.200742, 0, 1, 0.6745098, 1,
-0.1490671, 0.7954698, 1.229449, 0, 1, 0.682353, 1,
-0.1490211, 1.140439, 1.68349, 0, 1, 0.6862745, 1,
-0.1482208, -0.3611702, -4.604789, 0, 1, 0.6941177, 1,
-0.14621, -0.8662952, -4.088862, 0, 1, 0.7019608, 1,
-0.144862, -0.06342751, -1.328411, 0, 1, 0.7058824, 1,
-0.1428381, 0.4104631, -0.08023585, 0, 1, 0.7137255, 1,
-0.1372401, -1.373876, -1.02205, 0, 1, 0.7176471, 1,
-0.1355605, -0.7169412, -3.460448, 0, 1, 0.7254902, 1,
-0.1339792, 1.773909, 1.019756, 0, 1, 0.7294118, 1,
-0.1283112, 0.7830446, -0.1675605, 0, 1, 0.7372549, 1,
-0.1242208, 0.6787775, -0.968121, 0, 1, 0.7411765, 1,
-0.1239374, 2.050824, 1.891944, 0, 1, 0.7490196, 1,
-0.122838, 0.6336321, -1.432653, 0, 1, 0.7529412, 1,
-0.1221595, -1.33688, -3.331204, 0, 1, 0.7607843, 1,
-0.120549, 0.9360328, -2.033061, 0, 1, 0.7647059, 1,
-0.1190163, -0.5158889, -2.204784, 0, 1, 0.772549, 1,
-0.1189123, -0.2367329, -4.5872, 0, 1, 0.7764706, 1,
-0.1180163, 0.5381583, -0.06364698, 0, 1, 0.7843137, 1,
-0.1158823, -2.070529, -2.475728, 0, 1, 0.7882353, 1,
-0.1157165, -1.056859, -3.619449, 0, 1, 0.7960784, 1,
-0.1144849, -0.5048201, -3.170967, 0, 1, 0.8039216, 1,
-0.1137803, -1.417554, -1.426019, 0, 1, 0.8078431, 1,
-0.1101857, -0.2823573, -0.3441719, 0, 1, 0.8156863, 1,
-0.1098536, -0.9643748, -4.521797, 0, 1, 0.8196079, 1,
-0.1098228, 1.69067, 0.02118284, 0, 1, 0.827451, 1,
-0.1062593, -0.9515377, -4.913075, 0, 1, 0.8313726, 1,
-0.1058796, 0.8604596, -2.312765, 0, 1, 0.8392157, 1,
-0.1057834, -0.5146646, -3.401083, 0, 1, 0.8431373, 1,
-0.1055661, -0.7898139, -1.016374, 0, 1, 0.8509804, 1,
-0.1011257, 0.08338761, -0.1412864, 0, 1, 0.854902, 1,
-0.1010239, 0.4052948, 0.176992, 0, 1, 0.8627451, 1,
-0.1006401, -0.9815584, -4.049195, 0, 1, 0.8666667, 1,
-0.100285, 1.356523, 0.7504637, 0, 1, 0.8745098, 1,
-0.09947419, 0.3131009, -0.2811476, 0, 1, 0.8784314, 1,
-0.09935932, -0.7810093, -3.901205, 0, 1, 0.8862745, 1,
-0.0976752, -0.8462039, -1.969451, 0, 1, 0.8901961, 1,
-0.09456579, 1.457388, -0.7197278, 0, 1, 0.8980392, 1,
-0.09291745, -0.09426863, -1.788373, 0, 1, 0.9058824, 1,
-0.09070904, -0.05821415, -2.165435, 0, 1, 0.9098039, 1,
-0.08990283, -0.7585184, -3.423335, 0, 1, 0.9176471, 1,
-0.08904334, 1.237363, -0.7896625, 0, 1, 0.9215686, 1,
-0.08715321, -1.114028, -3.377122, 0, 1, 0.9294118, 1,
-0.08176771, -0.7658678, -3.631142, 0, 1, 0.9333333, 1,
-0.07812136, 0.5942854, 2.866463, 0, 1, 0.9411765, 1,
-0.07649823, -0.9378091, -2.875836, 0, 1, 0.945098, 1,
-0.07619649, 0.8725427, 0.3742355, 0, 1, 0.9529412, 1,
-0.07034914, -0.4389899, -3.185057, 0, 1, 0.9568627, 1,
-0.06545434, -0.988291, -4.500083, 0, 1, 0.9647059, 1,
-0.06383219, 0.5276312, -0.6549968, 0, 1, 0.9686275, 1,
-0.06378138, 0.8156812, 0.4655045, 0, 1, 0.9764706, 1,
-0.06234983, -0.5896149, -1.875228, 0, 1, 0.9803922, 1,
-0.06025169, -1.153138, -3.790687, 0, 1, 0.9882353, 1,
-0.0595001, -0.1024069, -2.83593, 0, 1, 0.9921569, 1,
-0.05792333, 0.9212829, 0.6376644, 0, 1, 1, 1,
-0.05087097, 1.082306, -1.882642, 0, 0.9921569, 1, 1,
-0.04908837, 1.734011, -0.008339423, 0, 0.9882353, 1, 1,
-0.04571768, 0.3549554, -0.4519357, 0, 0.9803922, 1, 1,
-0.0436151, -1.043968, -3.053594, 0, 0.9764706, 1, 1,
-0.04094962, 0.08945487, 0.9956267, 0, 0.9686275, 1, 1,
-0.03952206, -0.8319049, -2.073996, 0, 0.9647059, 1, 1,
-0.03798843, -0.3031595, -3.252526, 0, 0.9568627, 1, 1,
-0.02816826, 1.236368, -0.7139738, 0, 0.9529412, 1, 1,
-0.02454665, 1.031062, -0.4063756, 0, 0.945098, 1, 1,
-0.02404905, -1.25386, -2.269473, 0, 0.9411765, 1, 1,
-0.02261485, 0.1938716, 0.5728694, 0, 0.9333333, 1, 1,
-0.02256295, 1.719556, 0.3418905, 0, 0.9294118, 1, 1,
-0.02205838, 0.5856321, -2.298871, 0, 0.9215686, 1, 1,
-0.01916723, -1.649314, -3.983932, 0, 0.9176471, 1, 1,
-0.01900858, 0.7530517, -1.040251, 0, 0.9098039, 1, 1,
-0.0181182, 1.352106, -0.5400254, 0, 0.9058824, 1, 1,
-0.0163823, -0.5503231, -3.770663, 0, 0.8980392, 1, 1,
-0.01601939, 0.5074012, 0.2950459, 0, 0.8901961, 1, 1,
-0.007976164, 0.7892369, 3.051738, 0, 0.8862745, 1, 1,
-0.005458519, 0.4288037, -0.391902, 0, 0.8784314, 1, 1,
0.0001492045, -1.803996, 3.033937, 0, 0.8745098, 1, 1,
0.004981703, 0.9569146, 0.6715466, 0, 0.8666667, 1, 1,
0.006292344, 0.1912305, 0.096572, 0, 0.8627451, 1, 1,
0.007457518, 0.2624623, -0.4953687, 0, 0.854902, 1, 1,
0.007785184, 0.2192879, 0.02450878, 0, 0.8509804, 1, 1,
0.008406094, 0.5035248, -0.1712392, 0, 0.8431373, 1, 1,
0.01527021, -2.187504, 2.595639, 0, 0.8392157, 1, 1,
0.01664615, 0.5636098, 0.2941171, 0, 0.8313726, 1, 1,
0.01778159, -1.357584, 3.118356, 0, 0.827451, 1, 1,
0.02178854, 1.011848, 0.9340698, 0, 0.8196079, 1, 1,
0.02186573, 1.589602, -0.06277362, 0, 0.8156863, 1, 1,
0.02332631, 0.5816729, 0.04882361, 0, 0.8078431, 1, 1,
0.0240958, -1.477932, 3.212571, 0, 0.8039216, 1, 1,
0.02737748, 0.1087713, 0.4811856, 0, 0.7960784, 1, 1,
0.02949605, -0.002894124, 2.326246, 0, 0.7882353, 1, 1,
0.03008729, 0.1152213, -0.929449, 0, 0.7843137, 1, 1,
0.03144498, -0.07165159, 2.193054, 0, 0.7764706, 1, 1,
0.04018888, 0.7474537, -0.4599787, 0, 0.772549, 1, 1,
0.04108355, -1.031123, 2.725315, 0, 0.7647059, 1, 1,
0.04138824, 0.207637, -0.8968397, 0, 0.7607843, 1, 1,
0.0417558, 0.7717769, -0.3102782, 0, 0.7529412, 1, 1,
0.05205975, -0.3079028, 1.268988, 0, 0.7490196, 1, 1,
0.0558695, 0.09533923, -0.2275074, 0, 0.7411765, 1, 1,
0.05932732, -1.296104, 4.276488, 0, 0.7372549, 1, 1,
0.06163304, 0.2143228, 1.085957, 0, 0.7294118, 1, 1,
0.06404514, 0.4184183, 1.127057, 0, 0.7254902, 1, 1,
0.06684452, -0.5483884, 3.022749, 0, 0.7176471, 1, 1,
0.07146229, -0.8469955, 1.874596, 0, 0.7137255, 1, 1,
0.07316954, 0.281516, 0.2389984, 0, 0.7058824, 1, 1,
0.07389222, -0.1855892, 3.745689, 0, 0.6980392, 1, 1,
0.08010525, 1.182493, 0.4619088, 0, 0.6941177, 1, 1,
0.08448722, -0.2986681, 1.689983, 0, 0.6862745, 1, 1,
0.08536383, -0.5003882, 4.232608, 0, 0.682353, 1, 1,
0.0860374, -0.6119386, 1.812214, 0, 0.6745098, 1, 1,
0.08980627, -0.680895, 3.290313, 0, 0.6705883, 1, 1,
0.09056456, -0.1063013, 1.270336, 0, 0.6627451, 1, 1,
0.09065756, -0.2089476, 3.65226, 0, 0.6588235, 1, 1,
0.09506288, 0.6815718, -0.01040075, 0, 0.6509804, 1, 1,
0.09676667, -1.439407, 2.781848, 0, 0.6470588, 1, 1,
0.09711759, -0.1252726, 3.090049, 0, 0.6392157, 1, 1,
0.09865157, -0.7892271, 3.525598, 0, 0.6352941, 1, 1,
0.1061308, -1.038028, 4.461998, 0, 0.627451, 1, 1,
0.1096597, 1.156811, -2.57698, 0, 0.6235294, 1, 1,
0.110632, -0.2783632, 2.590695, 0, 0.6156863, 1, 1,
0.1132229, -0.6106851, 4.558018, 0, 0.6117647, 1, 1,
0.1164162, -0.8297389, 2.847856, 0, 0.6039216, 1, 1,
0.1170697, 0.7801565, 1.911276, 0, 0.5960785, 1, 1,
0.119078, 0.04802391, 0.6312864, 0, 0.5921569, 1, 1,
0.1267301, -1.768665, 3.187284, 0, 0.5843138, 1, 1,
0.134335, 0.4678975, -0.2478057, 0, 0.5803922, 1, 1,
0.1352867, -0.8005748, 4.639432, 0, 0.572549, 1, 1,
0.1381619, -0.3439288, 3.012485, 0, 0.5686275, 1, 1,
0.1381895, 0.2900561, -0.2814908, 0, 0.5607843, 1, 1,
0.1409187, 0.3260408, 0.2896581, 0, 0.5568628, 1, 1,
0.1429662, -0.7471535, 2.205682, 0, 0.5490196, 1, 1,
0.1516082, 0.05977697, 2.477926, 0, 0.5450981, 1, 1,
0.15588, -1.535231, 3.78859, 0, 0.5372549, 1, 1,
0.1560523, -0.5419895, 2.952919, 0, 0.5333334, 1, 1,
0.1590252, -1.116944, 2.118644, 0, 0.5254902, 1, 1,
0.1623144, -1.701859, 1.330266, 0, 0.5215687, 1, 1,
0.1642468, -2.375327, 3.630475, 0, 0.5137255, 1, 1,
0.1713546, -0.1060839, 3.574302, 0, 0.509804, 1, 1,
0.1775073, 0.03279337, 0.4476947, 0, 0.5019608, 1, 1,
0.1776246, -0.8905941, 4.28253, 0, 0.4941176, 1, 1,
0.1782758, 1.450258, 0.6580825, 0, 0.4901961, 1, 1,
0.1796089, -0.8742625, 1.475639, 0, 0.4823529, 1, 1,
0.1803932, -0.3820539, 3.605098, 0, 0.4784314, 1, 1,
0.1831563, 0.8934908, 0.07637325, 0, 0.4705882, 1, 1,
0.1866155, 0.06002126, 2.488379, 0, 0.4666667, 1, 1,
0.1981785, 1.010496, 0.3388604, 0, 0.4588235, 1, 1,
0.1983192, 0.1206963, 1.370815, 0, 0.454902, 1, 1,
0.2030479, -0.3637031, 3.504608, 0, 0.4470588, 1, 1,
0.2050455, 0.7293079, 0.8078659, 0, 0.4431373, 1, 1,
0.2064154, 0.308124, -0.7286308, 0, 0.4352941, 1, 1,
0.2082807, 0.4367936, 0.02784731, 0, 0.4313726, 1, 1,
0.2096801, 0.6794092, -2.149969, 0, 0.4235294, 1, 1,
0.2104493, -1.344979, 2.763664, 0, 0.4196078, 1, 1,
0.2176094, -0.611209, 3.126852, 0, 0.4117647, 1, 1,
0.2190778, 1.264475, 0.7799458, 0, 0.4078431, 1, 1,
0.2248468, 0.1697411, 0.4969793, 0, 0.4, 1, 1,
0.2283821, 1.159177, 1.059143, 0, 0.3921569, 1, 1,
0.2298972, -0.3764864, 3.025281, 0, 0.3882353, 1, 1,
0.2313504, -0.5994086, 1.916726, 0, 0.3803922, 1, 1,
0.231408, 0.3817762, 0.6994264, 0, 0.3764706, 1, 1,
0.2337915, 0.4566702, 2.436341, 0, 0.3686275, 1, 1,
0.2362628, 1.623518, 0.7189282, 0, 0.3647059, 1, 1,
0.2383861, -0.6242054, 3.039486, 0, 0.3568628, 1, 1,
0.2401309, 0.9633049, 0.3466174, 0, 0.3529412, 1, 1,
0.2436134, -0.7705815, 4.992127, 0, 0.345098, 1, 1,
0.2463441, 0.3377109, 0.925916, 0, 0.3411765, 1, 1,
0.2504522, -0.048964, -0.04539467, 0, 0.3333333, 1, 1,
0.2509949, 0.1421594, 1.433713, 0, 0.3294118, 1, 1,
0.2517456, -0.933791, 3.387848, 0, 0.3215686, 1, 1,
0.2549244, -0.4363362, 2.297597, 0, 0.3176471, 1, 1,
0.2552357, -0.825313, 2.664699, 0, 0.3098039, 1, 1,
0.2572371, -1.347343, 4.070632, 0, 0.3058824, 1, 1,
0.2626059, -0.09866378, 1.216735, 0, 0.2980392, 1, 1,
0.2638104, -0.3143198, 2.544237, 0, 0.2901961, 1, 1,
0.2719229, -1.761471, 1.159263, 0, 0.2862745, 1, 1,
0.2728316, 0.2000479, 0.3400822, 0, 0.2784314, 1, 1,
0.2756808, -0.9295307, 1.604365, 0, 0.2745098, 1, 1,
0.2818763, -1.028422, 3.423163, 0, 0.2666667, 1, 1,
0.2818844, 1.152355, 0.2444334, 0, 0.2627451, 1, 1,
0.2824601, 0.08885346, 0.283659, 0, 0.254902, 1, 1,
0.2853211, -0.5724636, 0.5945635, 0, 0.2509804, 1, 1,
0.2862721, -0.4837281, 2.963736, 0, 0.2431373, 1, 1,
0.2952508, -0.109608, 1.125198, 0, 0.2392157, 1, 1,
0.3023878, 1.86261, 0.1249841, 0, 0.2313726, 1, 1,
0.3050851, -0.2547152, 1.306091, 0, 0.227451, 1, 1,
0.306814, 0.3193749, 0.7356822, 0, 0.2196078, 1, 1,
0.3102374, 0.9142301, -0.1949988, 0, 0.2156863, 1, 1,
0.3203953, -0.6634205, 2.621524, 0, 0.2078431, 1, 1,
0.3229662, 1.61135, 1.009598, 0, 0.2039216, 1, 1,
0.3278509, -1.480394, 4.613093, 0, 0.1960784, 1, 1,
0.3312081, 0.9949446, -0.7603891, 0, 0.1882353, 1, 1,
0.3316289, 2.181743, -0.359053, 0, 0.1843137, 1, 1,
0.3319144, -1.65521, 3.557506, 0, 0.1764706, 1, 1,
0.3319336, 1.453101, 0.6793238, 0, 0.172549, 1, 1,
0.3338811, 0.8260301, 0.00112442, 0, 0.1647059, 1, 1,
0.3373708, -0.1784617, 1.723452, 0, 0.1607843, 1, 1,
0.3374017, -0.5240059, 4.901566, 0, 0.1529412, 1, 1,
0.3426229, -1.481669, 0.9001986, 0, 0.1490196, 1, 1,
0.3477663, -1.272888, 1.937085, 0, 0.1411765, 1, 1,
0.3530737, 0.1520194, 0.381431, 0, 0.1372549, 1, 1,
0.3558978, 1.133377, 0.2343254, 0, 0.1294118, 1, 1,
0.3561372, -0.05089941, 1.543856, 0, 0.1254902, 1, 1,
0.3585433, -1.065608, 4.259161, 0, 0.1176471, 1, 1,
0.3625876, 1.774679, 0.98859, 0, 0.1137255, 1, 1,
0.368495, -1.594107, 2.549613, 0, 0.1058824, 1, 1,
0.3685423, -0.5397484, 4.582651, 0, 0.09803922, 1, 1,
0.3764499, 0.9188748, 1.157018, 0, 0.09411765, 1, 1,
0.3830006, -1.317998, 2.157794, 0, 0.08627451, 1, 1,
0.3857136, 0.9590983, -0.9861999, 0, 0.08235294, 1, 1,
0.3883294, 0.6994155, -0.8685843, 0, 0.07450981, 1, 1,
0.3886943, -0.7243749, 3.888233, 0, 0.07058824, 1, 1,
0.3927264, -0.2918377, 2.041373, 0, 0.0627451, 1, 1,
0.3939942, 2.291535, 2.203135, 0, 0.05882353, 1, 1,
0.4008759, 0.5551761, -0.5252154, 0, 0.05098039, 1, 1,
0.4022164, 0.7394335, 0.2245608, 0, 0.04705882, 1, 1,
0.4056243, -1.109432, 3.900108, 0, 0.03921569, 1, 1,
0.4061593, 0.6678331, 1.092298, 0, 0.03529412, 1, 1,
0.4108225, 0.5590988, -0.3253792, 0, 0.02745098, 1, 1,
0.4111269, 1.827396, 0.2957346, 0, 0.02352941, 1, 1,
0.4175148, 0.9445927, 2.001238, 0, 0.01568628, 1, 1,
0.4197558, 0.1984954, 0.7611979, 0, 0.01176471, 1, 1,
0.421019, -0.356598, 2.966831, 0, 0.003921569, 1, 1,
0.4224008, 0.2362921, 1.245081, 0.003921569, 0, 1, 1,
0.4296502, -0.6221713, 2.805979, 0.007843138, 0, 1, 1,
0.4320789, 1.765087, 2.382273, 0.01568628, 0, 1, 1,
0.4344198, -0.1691083, 1.231993, 0.01960784, 0, 1, 1,
0.4367354, 0.9939147, -2.308645, 0.02745098, 0, 1, 1,
0.4394438, -0.08787925, 1.190061, 0.03137255, 0, 1, 1,
0.4395857, 0.3298313, -1.812069, 0.03921569, 0, 1, 1,
0.4402202, -1.09995, 1.58054, 0.04313726, 0, 1, 1,
0.4405988, -1.790376, 1.91663, 0.05098039, 0, 1, 1,
0.4431261, 0.03320432, 2.246197, 0.05490196, 0, 1, 1,
0.4443336, -0.1084661, 0.6783673, 0.0627451, 0, 1, 1,
0.4455274, 0.5268787, 1.859647, 0.06666667, 0, 1, 1,
0.4485843, 0.6676036, 0.1379138, 0.07450981, 0, 1, 1,
0.4496782, -0.5475894, 2.076373, 0.07843138, 0, 1, 1,
0.4518831, 0.1760978, 1.756769, 0.08627451, 0, 1, 1,
0.4679848, -1.308332, 4.663678, 0.09019608, 0, 1, 1,
0.4751098, 2.191483, -2.17216, 0.09803922, 0, 1, 1,
0.4757763, 0.6967954, 0.7627091, 0.1058824, 0, 1, 1,
0.4775864, -0.03193399, 1.249621, 0.1098039, 0, 1, 1,
0.4805079, 0.4480769, 2.734482, 0.1176471, 0, 1, 1,
0.4896161, -1.095027, 3.750314, 0.1215686, 0, 1, 1,
0.4978781, -0.8055491, 3.868978, 0.1294118, 0, 1, 1,
0.500245, -0.5386617, 3.083673, 0.1333333, 0, 1, 1,
0.5091084, 0.07045507, 2.124628, 0.1411765, 0, 1, 1,
0.5096151, -1.273075, 0.5927084, 0.145098, 0, 1, 1,
0.5112643, -0.2518525, 0.7991439, 0.1529412, 0, 1, 1,
0.5124262, 0.8434669, 2.69803, 0.1568628, 0, 1, 1,
0.5133379, -0.3031091, 2.16913, 0.1647059, 0, 1, 1,
0.5145862, 0.1915711, 2.570045, 0.1686275, 0, 1, 1,
0.5154351, 1.099054, 0.8463945, 0.1764706, 0, 1, 1,
0.5166449, -0.498831, 2.072425, 0.1803922, 0, 1, 1,
0.5176659, -0.9703121, 1.839591, 0.1882353, 0, 1, 1,
0.518296, -0.5155575, 2.763416, 0.1921569, 0, 1, 1,
0.5205245, 1.377966, -0.1499489, 0.2, 0, 1, 1,
0.5208622, -0.291836, 2.653969, 0.2078431, 0, 1, 1,
0.5240489, -0.2747706, 3.086143, 0.2117647, 0, 1, 1,
0.5279495, 0.3315578, 1.09121, 0.2196078, 0, 1, 1,
0.5324929, -1.318716, 2.796378, 0.2235294, 0, 1, 1,
0.5337973, 0.7900784, -0.04868256, 0.2313726, 0, 1, 1,
0.535887, -2.132244, 3.796314, 0.2352941, 0, 1, 1,
0.5372112, 1.179644, -0.5794639, 0.2431373, 0, 1, 1,
0.5376139, 1.414038, 1.382134, 0.2470588, 0, 1, 1,
0.5389054, -1.588793, 1.702499, 0.254902, 0, 1, 1,
0.5423058, -2.692507, 4.093628, 0.2588235, 0, 1, 1,
0.5423959, -0.132066, 2.192129, 0.2666667, 0, 1, 1,
0.5442688, 1.207049, 0.9509212, 0.2705882, 0, 1, 1,
0.5454293, -0.002957049, 1.416387, 0.2784314, 0, 1, 1,
0.5454695, 0.7211584, 0.7071939, 0.282353, 0, 1, 1,
0.545504, 0.1975648, 0.1962174, 0.2901961, 0, 1, 1,
0.5473704, -1.066277, 3.888424, 0.2941177, 0, 1, 1,
0.5569556, 1.041657, 0.1391997, 0.3019608, 0, 1, 1,
0.5586478, -1.913728, 2.532144, 0.3098039, 0, 1, 1,
0.5687823, 0.2113994, 1.138525, 0.3137255, 0, 1, 1,
0.5700201, 0.1090097, -0.05105982, 0.3215686, 0, 1, 1,
0.5704458, 0.0196729, 1.81828, 0.3254902, 0, 1, 1,
0.5718904, 0.3452175, -0.9109383, 0.3333333, 0, 1, 1,
0.5720147, 1.297585, 1.137581, 0.3372549, 0, 1, 1,
0.5770887, 0.6423463, 0.4673097, 0.345098, 0, 1, 1,
0.5784661, -1.151181, 1.407061, 0.3490196, 0, 1, 1,
0.5791891, -0.3212983, 2.667763, 0.3568628, 0, 1, 1,
0.5805479, 0.3846847, 1.95164, 0.3607843, 0, 1, 1,
0.5839586, 0.605313, -0.4980182, 0.3686275, 0, 1, 1,
0.5846494, -0.3401097, 2.322247, 0.372549, 0, 1, 1,
0.5868758, -0.4156113, 2.551163, 0.3803922, 0, 1, 1,
0.5873634, -1.310611, 4.739246, 0.3843137, 0, 1, 1,
0.5888177, -1.195078, 1.667116, 0.3921569, 0, 1, 1,
0.5915582, 0.2910202, 1.400195, 0.3960784, 0, 1, 1,
0.5956994, -0.7252216, 1.562846, 0.4039216, 0, 1, 1,
0.6039413, 0.1590418, 0.5809795, 0.4117647, 0, 1, 1,
0.6073313, -1.684345, 2.033775, 0.4156863, 0, 1, 1,
0.6088551, 1.00006, 1.747639, 0.4235294, 0, 1, 1,
0.6106312, -0.3206001, 3.348463, 0.427451, 0, 1, 1,
0.6146271, 0.1238463, 2.147288, 0.4352941, 0, 1, 1,
0.620761, 0.3560482, 2.262474, 0.4392157, 0, 1, 1,
0.621711, -0.3958172, 2.241532, 0.4470588, 0, 1, 1,
0.6224491, -1.547224, 3.700125, 0.4509804, 0, 1, 1,
0.6238944, 0.1937245, 2.394595, 0.4588235, 0, 1, 1,
0.6281697, -0.2508439, 2.192711, 0.4627451, 0, 1, 1,
0.628549, -0.5357192, 3.048033, 0.4705882, 0, 1, 1,
0.6291119, 1.022424, -0.222853, 0.4745098, 0, 1, 1,
0.6296635, -0.3879352, 4.003862, 0.4823529, 0, 1, 1,
0.6298159, -1.67073, 2.61251, 0.4862745, 0, 1, 1,
0.6320858, -1.112252, 3.037901, 0.4941176, 0, 1, 1,
0.6367548, -0.277942, 1.513244, 0.5019608, 0, 1, 1,
0.6382004, 0.06893609, 2.660049, 0.5058824, 0, 1, 1,
0.6407204, -0.384525, 2.440749, 0.5137255, 0, 1, 1,
0.6488929, -0.5511314, 2.190179, 0.5176471, 0, 1, 1,
0.6492729, 0.3120901, 2.712569, 0.5254902, 0, 1, 1,
0.6494524, 0.9268954, 1.290336, 0.5294118, 0, 1, 1,
0.6500819, 1.0654, -0.7476059, 0.5372549, 0, 1, 1,
0.652037, 2.524082, 0.7275117, 0.5411765, 0, 1, 1,
0.6525826, 0.7774497, 1.807534, 0.5490196, 0, 1, 1,
0.6582618, -0.6207722, 2.093187, 0.5529412, 0, 1, 1,
0.6643648, -1.16903, 2.475371, 0.5607843, 0, 1, 1,
0.6669036, -1.569806, 2.306284, 0.5647059, 0, 1, 1,
0.6709823, -0.5870771, 3.173039, 0.572549, 0, 1, 1,
0.6728577, -1.218952, 4.181901, 0.5764706, 0, 1, 1,
0.6758578, 0.7112914, -0.338574, 0.5843138, 0, 1, 1,
0.6763606, 0.4850848, 0.08984014, 0.5882353, 0, 1, 1,
0.6796989, 0.8473884, 1.440467, 0.5960785, 0, 1, 1,
0.6844345, 0.5425434, -0.05102623, 0.6039216, 0, 1, 1,
0.6935303, -0.3862252, 3.472088, 0.6078432, 0, 1, 1,
0.6935324, -1.219187, 1.012137, 0.6156863, 0, 1, 1,
0.6952343, 1.309584, 2.185726, 0.6196079, 0, 1, 1,
0.6969345, -0.03979139, 1.757983, 0.627451, 0, 1, 1,
0.705813, 0.05883201, 0.4251867, 0.6313726, 0, 1, 1,
0.7068281, 1.166112, 1.423561, 0.6392157, 0, 1, 1,
0.7140324, 1.922178, 1.102587, 0.6431373, 0, 1, 1,
0.7142241, -1.324457, 2.964323, 0.6509804, 0, 1, 1,
0.7154288, -0.3273199, -0.1232604, 0.654902, 0, 1, 1,
0.7260479, -0.6972574, 1.756108, 0.6627451, 0, 1, 1,
0.7342147, 0.4293332, 2.856724, 0.6666667, 0, 1, 1,
0.742899, -1.299124, 4.333734, 0.6745098, 0, 1, 1,
0.7439706, -0.2779356, 0.3573577, 0.6784314, 0, 1, 1,
0.7448386, -0.01484911, 3.202677, 0.6862745, 0, 1, 1,
0.7579081, -1.214256, 1.753151, 0.6901961, 0, 1, 1,
0.7604212, 0.7980469, 0.2073221, 0.6980392, 0, 1, 1,
0.7644793, 1.708897, 0.9372803, 0.7058824, 0, 1, 1,
0.7671482, -1.625593, 2.465906, 0.7098039, 0, 1, 1,
0.7691467, 0.4842299, -0.9434657, 0.7176471, 0, 1, 1,
0.7773296, -0.4217558, 2.330433, 0.7215686, 0, 1, 1,
0.7781625, -0.2754104, 2.05344, 0.7294118, 0, 1, 1,
0.7806135, 1.718918, -1.280212, 0.7333333, 0, 1, 1,
0.793582, 0.5264081, 0.645362, 0.7411765, 0, 1, 1,
0.7937566, -0.2652664, 1.780012, 0.7450981, 0, 1, 1,
0.8001878, 0.05086274, 1.462947, 0.7529412, 0, 1, 1,
0.802686, -0.1412939, 0.2933215, 0.7568628, 0, 1, 1,
0.809077, 0.2678039, 1.799503, 0.7647059, 0, 1, 1,
0.8121654, -0.1471666, 1.885984, 0.7686275, 0, 1, 1,
0.8127432, -1.94159, 1.84978, 0.7764706, 0, 1, 1,
0.813304, 0.8581595, -1.535327, 0.7803922, 0, 1, 1,
0.8164902, 0.1203573, 1.759936, 0.7882353, 0, 1, 1,
0.8206106, 2.282362, 2.473387, 0.7921569, 0, 1, 1,
0.8243597, 0.1289091, 2.231963, 0.8, 0, 1, 1,
0.825266, -0.6878209, 3.605434, 0.8078431, 0, 1, 1,
0.8255233, -0.1378913, 2.083696, 0.8117647, 0, 1, 1,
0.8255518, 0.7814939, 1.370909, 0.8196079, 0, 1, 1,
0.8304406, -0.001210082, -0.6876303, 0.8235294, 0, 1, 1,
0.8318377, -1.442214, 1.752483, 0.8313726, 0, 1, 1,
0.8320812, -1.137787, 2.095881, 0.8352941, 0, 1, 1,
0.8329719, 1.491567, 0.6263367, 0.8431373, 0, 1, 1,
0.8391255, 0.08596534, 0.4265318, 0.8470588, 0, 1, 1,
0.8392079, 1.621144, 1.489668, 0.854902, 0, 1, 1,
0.8399102, -0.0186506, 2.175685, 0.8588235, 0, 1, 1,
0.8452194, 0.05635692, 2.32862, 0.8666667, 0, 1, 1,
0.8482277, -0.6957842, 2.302881, 0.8705882, 0, 1, 1,
0.8502318, -0.6442745, 4.458107, 0.8784314, 0, 1, 1,
0.8525723, -0.552798, 2.060553, 0.8823529, 0, 1, 1,
0.8541012, -0.7027723, 1.510217, 0.8901961, 0, 1, 1,
0.8578954, -0.7310255, 3.817402, 0.8941177, 0, 1, 1,
0.8598027, 0.8130584, -0.665773, 0.9019608, 0, 1, 1,
0.8636025, 0.05087161, 1.764795, 0.9098039, 0, 1, 1,
0.8703628, -1.616175, 2.603105, 0.9137255, 0, 1, 1,
0.8742308, 0.002165441, 0.3013568, 0.9215686, 0, 1, 1,
0.8746573, 0.3765587, 3.630869, 0.9254902, 0, 1, 1,
0.8941494, -0.644487, 3.107007, 0.9333333, 0, 1, 1,
0.8996057, -0.546639, 2.656475, 0.9372549, 0, 1, 1,
0.9004439, 0.4864452, 0.8643352, 0.945098, 0, 1, 1,
0.9046511, 0.4743503, 0.5020945, 0.9490196, 0, 1, 1,
0.9073765, 1.771608, 0.7105762, 0.9568627, 0, 1, 1,
0.9100223, 1.641984, -0.8011783, 0.9607843, 0, 1, 1,
0.9106871, -0.2789834, 1.98179, 0.9686275, 0, 1, 1,
0.9113597, 1.135051, 1.209922, 0.972549, 0, 1, 1,
0.9126358, 0.6725825, 2.73496, 0.9803922, 0, 1, 1,
0.9160185, 0.9526993, 0.1594584, 0.9843137, 0, 1, 1,
0.928351, 1.662452, 1.345696, 0.9921569, 0, 1, 1,
0.9402712, -0.1273486, 1.423322, 0.9960784, 0, 1, 1,
0.9408905, -0.8926618, 2.723309, 1, 0, 0.9960784, 1,
0.944577, 0.609455, 2.039768, 1, 0, 0.9882353, 1,
0.9454276, 0.9922391, 1.53078, 1, 0, 0.9843137, 1,
0.9562438, 0.7799578, -0.5285387, 1, 0, 0.9764706, 1,
0.9579026, -0.7581943, 2.126255, 1, 0, 0.972549, 1,
0.9687175, 0.7965755, 0.4936281, 1, 0, 0.9647059, 1,
0.9710539, -0.5251562, 2.352667, 1, 0, 0.9607843, 1,
0.9719624, -0.456301, 2.105206, 1, 0, 0.9529412, 1,
0.9728698, 0.0938359, -0.04206846, 1, 0, 0.9490196, 1,
0.9845597, -0.04566655, 0.5897557, 1, 0, 0.9411765, 1,
0.9914042, -1.187375, 0.9282838, 1, 0, 0.9372549, 1,
0.9941324, -0.7706438, 4.399722, 1, 0, 0.9294118, 1,
0.996779, -0.6813618, 0.6421487, 1, 0, 0.9254902, 1,
0.9974611, -0.988625, 2.066889, 1, 0, 0.9176471, 1,
0.9994806, -0.5299324, 2.69703, 1, 0, 0.9137255, 1,
1.003603, -0.9686878, 3.427761, 1, 0, 0.9058824, 1,
1.00376, 0.6983636, 1.489868, 1, 0, 0.9019608, 1,
1.008907, 0.9806117, 0.862137, 1, 0, 0.8941177, 1,
1.009738, 1.202036, 1.754299, 1, 0, 0.8862745, 1,
1.019355, 1.820122, -0.1600584, 1, 0, 0.8823529, 1,
1.020311, -1.780316, 2.739583, 1, 0, 0.8745098, 1,
1.022119, -1.785202, 2.498245, 1, 0, 0.8705882, 1,
1.022864, -0.9771694, 1.688584, 1, 0, 0.8627451, 1,
1.031596, 1.426998, 1.030564, 1, 0, 0.8588235, 1,
1.03721, -0.0244035, 1.097324, 1, 0, 0.8509804, 1,
1.060852, -1.295314, 2.575976, 1, 0, 0.8470588, 1,
1.06658, 0.3522125, 0.2673029, 1, 0, 0.8392157, 1,
1.078281, -0.2373955, 0.4557583, 1, 0, 0.8352941, 1,
1.079235, -0.9237592, 2.112833, 1, 0, 0.827451, 1,
1.086923, -1.147191, 3.445413, 1, 0, 0.8235294, 1,
1.091637, 1.696662, 0.9073448, 1, 0, 0.8156863, 1,
1.094218, 0.7079867, 3.113208, 1, 0, 0.8117647, 1,
1.108945, -0.4787573, 2.503919, 1, 0, 0.8039216, 1,
1.122046, 2.223946, -0.09381175, 1, 0, 0.7960784, 1,
1.123924, -1.512375, 2.223226, 1, 0, 0.7921569, 1,
1.131383, -0.4123214, 1.845157, 1, 0, 0.7843137, 1,
1.134913, -0.9688776, 3.251554, 1, 0, 0.7803922, 1,
1.139192, 0.9913636, 2.239608, 1, 0, 0.772549, 1,
1.143889, 0.2921482, -0.5145363, 1, 0, 0.7686275, 1,
1.153346, 0.01486367, 0.7111396, 1, 0, 0.7607843, 1,
1.15386, 1.021993, 0.3811267, 1, 0, 0.7568628, 1,
1.15426, 0.1074373, 2.220099, 1, 0, 0.7490196, 1,
1.161694, 0.2576415, 0.8725818, 1, 0, 0.7450981, 1,
1.164045, -1.696358, 1.727197, 1, 0, 0.7372549, 1,
1.16747, -0.1294575, 1.611025, 1, 0, 0.7333333, 1,
1.16902, -0.03256772, 2.153105, 1, 0, 0.7254902, 1,
1.171107, -0.3754656, 2.411152, 1, 0, 0.7215686, 1,
1.172634, -0.4418671, 2.852042, 1, 0, 0.7137255, 1,
1.184181, 0.5470421, 1.892745, 1, 0, 0.7098039, 1,
1.184259, 1.871053, -0.5281221, 1, 0, 0.7019608, 1,
1.186575, -1.509818, 1.032568, 1, 0, 0.6941177, 1,
1.188759, 1.316724, 1.083434, 1, 0, 0.6901961, 1,
1.189761, 0.6663065, 0.5590399, 1, 0, 0.682353, 1,
1.193534, -0.7477769, 1.534799, 1, 0, 0.6784314, 1,
1.194969, 0.8450424, -0.2700225, 1, 0, 0.6705883, 1,
1.196174, 0.1271065, 0.96222, 1, 0, 0.6666667, 1,
1.198412, -0.8306665, 0.9618894, 1, 0, 0.6588235, 1,
1.209847, -0.8605444, 0.9355624, 1, 0, 0.654902, 1,
1.221009, 0.1258199, 0.9203611, 1, 0, 0.6470588, 1,
1.223685, 0.3872091, 2.310461, 1, 0, 0.6431373, 1,
1.226232, 0.2673076, 1.795737, 1, 0, 0.6352941, 1,
1.227864, -1.606496, 3.795851, 1, 0, 0.6313726, 1,
1.23002, -1.762078, 3.46528, 1, 0, 0.6235294, 1,
1.233152, 0.1089364, 2.361066, 1, 0, 0.6196079, 1,
1.235289, -0.5609219, 0.7276257, 1, 0, 0.6117647, 1,
1.236745, -0.3305246, 2.309352, 1, 0, 0.6078432, 1,
1.245465, 0.5290836, 0.534263, 1, 0, 0.6, 1,
1.261344, 2.100544, -0.8785893, 1, 0, 0.5921569, 1,
1.262516, -0.1860023, 3.500661, 1, 0, 0.5882353, 1,
1.268017, -0.0880008, 1.006143, 1, 0, 0.5803922, 1,
1.269681, -0.1449682, 1.290157, 1, 0, 0.5764706, 1,
1.272198, -1.901495, 1.368395, 1, 0, 0.5686275, 1,
1.277865, 0.4194238, 1.503115, 1, 0, 0.5647059, 1,
1.281144, -0.7430291, 2.832126, 1, 0, 0.5568628, 1,
1.285809, -0.2020212, 1.802135, 1, 0, 0.5529412, 1,
1.291131, -0.09602045, 2.250174, 1, 0, 0.5450981, 1,
1.30725, 0.157193, 0.4184744, 1, 0, 0.5411765, 1,
1.309968, -0.3739165, 2.163481, 1, 0, 0.5333334, 1,
1.310695, 0.09254196, 1.440922, 1, 0, 0.5294118, 1,
1.312813, -0.1882604, 3.138269, 1, 0, 0.5215687, 1,
1.314357, 0.6866989, 0.735172, 1, 0, 0.5176471, 1,
1.318952, -0.6287957, 0.9665656, 1, 0, 0.509804, 1,
1.319149, -0.2314759, 2.811969, 1, 0, 0.5058824, 1,
1.319823, -0.3825513, 2.397924, 1, 0, 0.4980392, 1,
1.326441, -0.5490912, 1.658726, 1, 0, 0.4901961, 1,
1.330948, 0.6269494, 2.36671, 1, 0, 0.4862745, 1,
1.33547, 0.5431095, -0.08447208, 1, 0, 0.4784314, 1,
1.340049, 0.140631, 1.288096, 1, 0, 0.4745098, 1,
1.343289, 1.031172, -0.8759353, 1, 0, 0.4666667, 1,
1.343902, -0.09830181, 1.482225, 1, 0, 0.4627451, 1,
1.344675, 2.522744, -0.1082365, 1, 0, 0.454902, 1,
1.34947, 0.3452615, 3.363918, 1, 0, 0.4509804, 1,
1.370739, 0.8555462, 0.01895319, 1, 0, 0.4431373, 1,
1.375386, 0.3001097, 4.278852, 1, 0, 0.4392157, 1,
1.384559, 1.028724, 1.968015, 1, 0, 0.4313726, 1,
1.387977, 0.9282658, -0.4929543, 1, 0, 0.427451, 1,
1.390449, -0.3664745, 3.067457, 1, 0, 0.4196078, 1,
1.392958, -1.019247, 3.094189, 1, 0, 0.4156863, 1,
1.407652, -1.042971, 2.6761, 1, 0, 0.4078431, 1,
1.419859, 1.253776, 0.6983026, 1, 0, 0.4039216, 1,
1.420228, -0.7862851, 2.329641, 1, 0, 0.3960784, 1,
1.425164, -0.175511, 2.284316, 1, 0, 0.3882353, 1,
1.426754, -0.4384669, 3.456899, 1, 0, 0.3843137, 1,
1.435724, -1.927985, 2.456008, 1, 0, 0.3764706, 1,
1.437912, 1.153334, 2.029259, 1, 0, 0.372549, 1,
1.43907, 1.292533, -0.1838969, 1, 0, 0.3647059, 1,
1.441975, 0.6919444, 2.008523, 1, 0, 0.3607843, 1,
1.44859, -1.369774, 2.311879, 1, 0, 0.3529412, 1,
1.45396, 0.921077, 1.415527, 1, 0, 0.3490196, 1,
1.481477, -0.1934225, 2.024379, 1, 0, 0.3411765, 1,
1.483681, 0.4170333, -1.397266, 1, 0, 0.3372549, 1,
1.500477, -1.135511, 2.589298, 1, 0, 0.3294118, 1,
1.503999, 1.202085, -1.082374, 1, 0, 0.3254902, 1,
1.518819, -0.9944881, 1.399936, 1, 0, 0.3176471, 1,
1.528295, -0.3102248, 3.721589, 1, 0, 0.3137255, 1,
1.533227, -1.286364, 3.307552, 1, 0, 0.3058824, 1,
1.551117, 0.1980204, 3.181741, 1, 0, 0.2980392, 1,
1.563007, 1.530739, 1.455662, 1, 0, 0.2941177, 1,
1.570877, -0.8948334, 2.541236, 1, 0, 0.2862745, 1,
1.576771, -0.48563, 0.9847919, 1, 0, 0.282353, 1,
1.58111, -1.208442, 2.277766, 1, 0, 0.2745098, 1,
1.583579, -0.8507246, 1.247228, 1, 0, 0.2705882, 1,
1.587658, 0.3820654, 1.014044, 1, 0, 0.2627451, 1,
1.607595, -1.588336, 4.257984, 1, 0, 0.2588235, 1,
1.615457, 0.2056031, 0.7474254, 1, 0, 0.2509804, 1,
1.625301, 0.3112784, 1.821267, 1, 0, 0.2470588, 1,
1.627335, 0.1827654, 0.6466723, 1, 0, 0.2392157, 1,
1.64311, 1.018048, 1.57434, 1, 0, 0.2352941, 1,
1.674862, 1.469968, 0.8848119, 1, 0, 0.227451, 1,
1.691773, 0.7218105, -0.2393478, 1, 0, 0.2235294, 1,
1.697888, -0.8582728, 1.70473, 1, 0, 0.2156863, 1,
1.704727, -0.02370937, 1.916036, 1, 0, 0.2117647, 1,
1.714019, 0.4370417, 2.440639, 1, 0, 0.2039216, 1,
1.734209, -1.456749, 3.421759, 1, 0, 0.1960784, 1,
1.736236, -0.2997178, 3.655021, 1, 0, 0.1921569, 1,
1.741157, 1.489274, 2.13483, 1, 0, 0.1843137, 1,
1.811184, -1.033699, 2.932281, 1, 0, 0.1803922, 1,
1.823452, -0.09043958, 2.858653, 1, 0, 0.172549, 1,
1.835162, -0.1544689, 0.2574704, 1, 0, 0.1686275, 1,
1.842586, 0.5260264, 2.23129, 1, 0, 0.1607843, 1,
1.858522, 1.272369, 0.4840785, 1, 0, 0.1568628, 1,
1.89491, 0.3548378, 1.41554, 1, 0, 0.1490196, 1,
1.912514, 0.8310447, 3.463245, 1, 0, 0.145098, 1,
1.938859, 0.3762252, -0.3138084, 1, 0, 0.1372549, 1,
1.940827, -0.479952, 1.856275, 1, 0, 0.1333333, 1,
1.963462, -0.07611036, 3.26579, 1, 0, 0.1254902, 1,
2.003726, -1.66639, 2.285918, 1, 0, 0.1215686, 1,
2.00578, 1.161487, 0.9252343, 1, 0, 0.1137255, 1,
2.00648, -0.9711383, 2.63158, 1, 0, 0.1098039, 1,
2.010494, 0.1510838, 2.962494, 1, 0, 0.1019608, 1,
2.018582, -0.02290722, 0.5061089, 1, 0, 0.09411765, 1,
2.051543, -0.5642414, 0.6313456, 1, 0, 0.09019608, 1,
2.069429, 0.4622228, 0.009709475, 1, 0, 0.08235294, 1,
2.074244, 1.507631, 0.7973598, 1, 0, 0.07843138, 1,
2.097598, -0.6512316, 0.5784764, 1, 0, 0.07058824, 1,
2.140935, 0.7568917, 1.959895, 1, 0, 0.06666667, 1,
2.162573, -0.4143444, 0.2763323, 1, 0, 0.05882353, 1,
2.199007, -0.3209005, 2.845621, 1, 0, 0.05490196, 1,
2.210738, 0.1715217, 2.638892, 1, 0, 0.04705882, 1,
2.314217, 0.9043228, 0.1125251, 1, 0, 0.04313726, 1,
2.322633, 0.2848918, 0.7984475, 1, 0, 0.03529412, 1,
2.327447, -0.7832203, 2.219476, 1, 0, 0.03137255, 1,
2.329382, -0.7757313, 1.757979, 1, 0, 0.02352941, 1,
2.433305, -1.136383, -0.2044659, 1, 0, 0.01960784, 1,
2.478172, -0.8617895, 2.121219, 1, 0, 0.01176471, 1,
2.761745, 1.587597, -0.4926113, 1, 0, 0.007843138, 1
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
-0.3138548, -4.118639, -6.82886, 0, -0.5, 0.5, 0.5,
-0.3138548, -4.118639, -6.82886, 1, -0.5, 0.5, 0.5,
-0.3138548, -4.118639, -6.82886, 1, 1.5, 0.5, 0.5,
-0.3138548, -4.118639, -6.82886, 0, 1.5, 0.5, 0.5
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
-4.432083, 0.02904701, -6.82886, 0, -0.5, 0.5, 0.5,
-4.432083, 0.02904701, -6.82886, 1, -0.5, 0.5, 0.5,
-4.432083, 0.02904701, -6.82886, 1, 1.5, 0.5, 0.5,
-4.432083, 0.02904701, -6.82886, 0, 1.5, 0.5, 0.5
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
-4.432083, -4.118639, -0.06173635, 0, -0.5, 0.5, 0.5,
-4.432083, -4.118639, -0.06173635, 1, -0.5, 0.5, 0.5,
-4.432083, -4.118639, -0.06173635, 1, 1.5, 0.5, 0.5,
-4.432083, -4.118639, -0.06173635, 0, 1.5, 0.5, 0.5
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
-3, -3.161481, -5.267216,
2, -3.161481, -5.267216,
-3, -3.161481, -5.267216,
-3, -3.321007, -5.52749,
-2, -3.161481, -5.267216,
-2, -3.321007, -5.52749,
-1, -3.161481, -5.267216,
-1, -3.321007, -5.52749,
0, -3.161481, -5.267216,
0, -3.321007, -5.52749,
1, -3.161481, -5.267216,
1, -3.321007, -5.52749,
2, -3.161481, -5.267216,
2, -3.321007, -5.52749
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
-3, -3.64006, -6.048038, 0, -0.5, 0.5, 0.5,
-3, -3.64006, -6.048038, 1, -0.5, 0.5, 0.5,
-3, -3.64006, -6.048038, 1, 1.5, 0.5, 0.5,
-3, -3.64006, -6.048038, 0, 1.5, 0.5, 0.5,
-2, -3.64006, -6.048038, 0, -0.5, 0.5, 0.5,
-2, -3.64006, -6.048038, 1, -0.5, 0.5, 0.5,
-2, -3.64006, -6.048038, 1, 1.5, 0.5, 0.5,
-2, -3.64006, -6.048038, 0, 1.5, 0.5, 0.5,
-1, -3.64006, -6.048038, 0, -0.5, 0.5, 0.5,
-1, -3.64006, -6.048038, 1, -0.5, 0.5, 0.5,
-1, -3.64006, -6.048038, 1, 1.5, 0.5, 0.5,
-1, -3.64006, -6.048038, 0, 1.5, 0.5, 0.5,
0, -3.64006, -6.048038, 0, -0.5, 0.5, 0.5,
0, -3.64006, -6.048038, 1, -0.5, 0.5, 0.5,
0, -3.64006, -6.048038, 1, 1.5, 0.5, 0.5,
0, -3.64006, -6.048038, 0, 1.5, 0.5, 0.5,
1, -3.64006, -6.048038, 0, -0.5, 0.5, 0.5,
1, -3.64006, -6.048038, 1, -0.5, 0.5, 0.5,
1, -3.64006, -6.048038, 1, 1.5, 0.5, 0.5,
1, -3.64006, -6.048038, 0, 1.5, 0.5, 0.5,
2, -3.64006, -6.048038, 0, -0.5, 0.5, 0.5,
2, -3.64006, -6.048038, 1, -0.5, 0.5, 0.5,
2, -3.64006, -6.048038, 1, 1.5, 0.5, 0.5,
2, -3.64006, -6.048038, 0, 1.5, 0.5, 0.5
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
-3.481723, -3, -5.267216,
-3.481723, 3, -5.267216,
-3.481723, -3, -5.267216,
-3.640116, -3, -5.52749,
-3.481723, -2, -5.267216,
-3.640116, -2, -5.52749,
-3.481723, -1, -5.267216,
-3.640116, -1, -5.52749,
-3.481723, 0, -5.267216,
-3.640116, 0, -5.52749,
-3.481723, 1, -5.267216,
-3.640116, 1, -5.52749,
-3.481723, 2, -5.267216,
-3.640116, 2, -5.52749,
-3.481723, 3, -5.267216,
-3.640116, 3, -5.52749
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
-3.956903, -3, -6.048038, 0, -0.5, 0.5, 0.5,
-3.956903, -3, -6.048038, 1, -0.5, 0.5, 0.5,
-3.956903, -3, -6.048038, 1, 1.5, 0.5, 0.5,
-3.956903, -3, -6.048038, 0, 1.5, 0.5, 0.5,
-3.956903, -2, -6.048038, 0, -0.5, 0.5, 0.5,
-3.956903, -2, -6.048038, 1, -0.5, 0.5, 0.5,
-3.956903, -2, -6.048038, 1, 1.5, 0.5, 0.5,
-3.956903, -2, -6.048038, 0, 1.5, 0.5, 0.5,
-3.956903, -1, -6.048038, 0, -0.5, 0.5, 0.5,
-3.956903, -1, -6.048038, 1, -0.5, 0.5, 0.5,
-3.956903, -1, -6.048038, 1, 1.5, 0.5, 0.5,
-3.956903, -1, -6.048038, 0, 1.5, 0.5, 0.5,
-3.956903, 0, -6.048038, 0, -0.5, 0.5, 0.5,
-3.956903, 0, -6.048038, 1, -0.5, 0.5, 0.5,
-3.956903, 0, -6.048038, 1, 1.5, 0.5, 0.5,
-3.956903, 0, -6.048038, 0, 1.5, 0.5, 0.5,
-3.956903, 1, -6.048038, 0, -0.5, 0.5, 0.5,
-3.956903, 1, -6.048038, 1, -0.5, 0.5, 0.5,
-3.956903, 1, -6.048038, 1, 1.5, 0.5, 0.5,
-3.956903, 1, -6.048038, 0, 1.5, 0.5, 0.5,
-3.956903, 2, -6.048038, 0, -0.5, 0.5, 0.5,
-3.956903, 2, -6.048038, 1, -0.5, 0.5, 0.5,
-3.956903, 2, -6.048038, 1, 1.5, 0.5, 0.5,
-3.956903, 2, -6.048038, 0, 1.5, 0.5, 0.5,
-3.956903, 3, -6.048038, 0, -0.5, 0.5, 0.5,
-3.956903, 3, -6.048038, 1, -0.5, 0.5, 0.5,
-3.956903, 3, -6.048038, 1, 1.5, 0.5, 0.5,
-3.956903, 3, -6.048038, 0, 1.5, 0.5, 0.5
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
-3.481723, -3.161481, -4,
-3.481723, -3.161481, 4,
-3.481723, -3.161481, -4,
-3.640116, -3.321007, -4,
-3.481723, -3.161481, -2,
-3.640116, -3.321007, -2,
-3.481723, -3.161481, 0,
-3.640116, -3.321007, 0,
-3.481723, -3.161481, 2,
-3.640116, -3.321007, 2,
-3.481723, -3.161481, 4,
-3.640116, -3.321007, 4
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
-3.956903, -3.64006, -4, 0, -0.5, 0.5, 0.5,
-3.956903, -3.64006, -4, 1, -0.5, 0.5, 0.5,
-3.956903, -3.64006, -4, 1, 1.5, 0.5, 0.5,
-3.956903, -3.64006, -4, 0, 1.5, 0.5, 0.5,
-3.956903, -3.64006, -2, 0, -0.5, 0.5, 0.5,
-3.956903, -3.64006, -2, 1, -0.5, 0.5, 0.5,
-3.956903, -3.64006, -2, 1, 1.5, 0.5, 0.5,
-3.956903, -3.64006, -2, 0, 1.5, 0.5, 0.5,
-3.956903, -3.64006, 0, 0, -0.5, 0.5, 0.5,
-3.956903, -3.64006, 0, 1, -0.5, 0.5, 0.5,
-3.956903, -3.64006, 0, 1, 1.5, 0.5, 0.5,
-3.956903, -3.64006, 0, 0, 1.5, 0.5, 0.5,
-3.956903, -3.64006, 2, 0, -0.5, 0.5, 0.5,
-3.956903, -3.64006, 2, 1, -0.5, 0.5, 0.5,
-3.956903, -3.64006, 2, 1, 1.5, 0.5, 0.5,
-3.956903, -3.64006, 2, 0, 1.5, 0.5, 0.5,
-3.956903, -3.64006, 4, 0, -0.5, 0.5, 0.5,
-3.956903, -3.64006, 4, 1, -0.5, 0.5, 0.5,
-3.956903, -3.64006, 4, 1, 1.5, 0.5, 0.5,
-3.956903, -3.64006, 4, 0, 1.5, 0.5, 0.5
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
-3.481723, -3.161481, -5.267216,
-3.481723, 3.219575, -5.267216,
-3.481723, -3.161481, 5.143744,
-3.481723, 3.219575, 5.143744,
-3.481723, -3.161481, -5.267216,
-3.481723, -3.161481, 5.143744,
-3.481723, 3.219575, -5.267216,
-3.481723, 3.219575, 5.143744,
-3.481723, -3.161481, -5.267216,
2.854013, -3.161481, -5.267216,
-3.481723, -3.161481, 5.143744,
2.854013, -3.161481, 5.143744,
-3.481723, 3.219575, -5.267216,
2.854013, 3.219575, -5.267216,
-3.481723, 3.219575, 5.143744,
2.854013, 3.219575, 5.143744,
2.854013, -3.161481, -5.267216,
2.854013, 3.219575, -5.267216,
2.854013, -3.161481, 5.143744,
2.854013, 3.219575, 5.143744,
2.854013, -3.161481, -5.267216,
2.854013, -3.161481, 5.143744,
2.854013, 3.219575, -5.267216,
2.854013, 3.219575, 5.143744
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
var radius = 7.345824;
var distance = 32.6824;
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
mvMatrix.translate( 0.3138548, -0.02904701, 0.06173635 );
mvMatrix.scale( 1.253595, 1.244692, 0.7628931 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.6824);
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
triazine-2-amine<-read.table("triazine-2-amine.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-triazine-2-amine$V2
```

```
## Error in eval(expr, envir, enclos): object 'triazine' not found
```

```r
y<-triazine-2-amine$V3
```

```
## Error in eval(expr, envir, enclos): object 'triazine' not found
```

```r
z<-triazine-2-amine$V4
```

```
## Error in eval(expr, envir, enclos): object 'triazine' not found
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
-3.389455, -1.092099, -2.021732, 0, 0, 1, 1, 1,
-3.094261, 0.5411032, -2.259243, 1, 0, 0, 1, 1,
-3.018995, 0.6662979, -1.61711, 1, 0, 0, 1, 1,
-2.793287, 2.109954, -1.283102, 1, 0, 0, 1, 1,
-2.779206, 1.037669, -3.838932, 1, 0, 0, 1, 1,
-2.775585, 0.263705, -0.6210708, 1, 0, 0, 1, 1,
-2.587501, -0.6175021, -2.415742, 0, 0, 0, 1, 1,
-2.561856, 0.5693263, -2.683397, 0, 0, 0, 1, 1,
-2.495764, 0.269722, -2.6022, 0, 0, 0, 1, 1,
-2.488878, 0.4142534, -3.420766, 0, 0, 0, 1, 1,
-2.471985, 0.4759743, -0.5842031, 0, 0, 0, 1, 1,
-2.471717, 0.4884714, -0.9561905, 0, 0, 0, 1, 1,
-2.39908, 0.2202321, -0.9353892, 0, 0, 0, 1, 1,
-2.383071, 1.503085, -1.909859, 1, 1, 1, 1, 1,
-2.342883, 0.06753943, -1.309832, 1, 1, 1, 1, 1,
-2.321892, 1.253838, -1.808731, 1, 1, 1, 1, 1,
-2.232759, -0.9109915, -2.756275, 1, 1, 1, 1, 1,
-2.225224, 1.028209, -1.027891, 1, 1, 1, 1, 1,
-2.213567, 1.050247, -2.362987, 1, 1, 1, 1, 1,
-2.135071, 1.423903, -0.07420157, 1, 1, 1, 1, 1,
-2.125082, 0.3876882, -1.547325, 1, 1, 1, 1, 1,
-2.086173, -0.5928185, -1.767591, 1, 1, 1, 1, 1,
-2.040915, 0.805562, 0.158027, 1, 1, 1, 1, 1,
-2.016177, -1.899217, -2.268442, 1, 1, 1, 1, 1,
-2.006459, -0.05134614, -1.144709, 1, 1, 1, 1, 1,
-2.004691, 0.4016999, -1.045677, 1, 1, 1, 1, 1,
-1.998478, 0.129749, -1.569253, 1, 1, 1, 1, 1,
-1.957577, 0.6539222, 0.1042422, 1, 1, 1, 1, 1,
-1.950327, -0.1683539, -1.171524, 0, 0, 1, 1, 1,
-1.936904, -0.8538495, -1.843305, 1, 0, 0, 1, 1,
-1.917737, 0.2047526, -1.34126, 1, 0, 0, 1, 1,
-1.913008, 0.2634937, -1.938471, 1, 0, 0, 1, 1,
-1.906704, 1.216612, -1.455491, 1, 0, 0, 1, 1,
-1.887201, 0.4014547, -0.9393007, 1, 0, 0, 1, 1,
-1.879851, -0.1878893, -0.9896525, 0, 0, 0, 1, 1,
-1.873259, 0.5945509, -0.3789623, 0, 0, 0, 1, 1,
-1.844293, 0.1738908, -0.7696903, 0, 0, 0, 1, 1,
-1.84078, 0.1228688, -0.487725, 0, 0, 0, 1, 1,
-1.825657, 1.237257, -0.1099725, 0, 0, 0, 1, 1,
-1.82003, 1.409234, -0.9444256, 0, 0, 0, 1, 1,
-1.76569, -0.2056746, -1.777729, 0, 0, 0, 1, 1,
-1.74118, -0.2613699, -2.237325, 1, 1, 1, 1, 1,
-1.738195, -0.1881149, -1.974378, 1, 1, 1, 1, 1,
-1.732881, -0.3593293, -2.35381, 1, 1, 1, 1, 1,
-1.721484, 0.03485649, -1.153964, 1, 1, 1, 1, 1,
-1.70631, -1.454665, -1.879105, 1, 1, 1, 1, 1,
-1.694051, 0.8700718, -0.6020687, 1, 1, 1, 1, 1,
-1.690971, -1.135516, -0.153375, 1, 1, 1, 1, 1,
-1.689504, -0.2025967, -1.860481, 1, 1, 1, 1, 1,
-1.683794, -0.3259449, -0.9843865, 1, 1, 1, 1, 1,
-1.680291, -0.5859583, -1.077281, 1, 1, 1, 1, 1,
-1.659545, 0.2140412, -0.9373342, 1, 1, 1, 1, 1,
-1.658379, 0.5480716, -1.042939, 1, 1, 1, 1, 1,
-1.655253, -0.747463, -1.834625, 1, 1, 1, 1, 1,
-1.649021, 0.06204667, 1.35904, 1, 1, 1, 1, 1,
-1.645191, -0.1265131, 0.7160779, 1, 1, 1, 1, 1,
-1.641811, -0.296468, -2.859804, 0, 0, 1, 1, 1,
-1.6024, 1.413061, -3.019329, 1, 0, 0, 1, 1,
-1.599863, -0.5069349, -3.280261, 1, 0, 0, 1, 1,
-1.597011, -0.9180905, -1.695342, 1, 0, 0, 1, 1,
-1.596098, -0.640993, -1.840151, 1, 0, 0, 1, 1,
-1.583617, 1.43321, -1.66471, 1, 0, 0, 1, 1,
-1.580347, -1.192439, -1.449659, 0, 0, 0, 1, 1,
-1.577291, 1.070864, -0.306019, 0, 0, 0, 1, 1,
-1.569314, 1.34738, 0.01466541, 0, 0, 0, 1, 1,
-1.54512, -0.7475956, -1.534881, 0, 0, 0, 1, 1,
-1.533202, -0.4557365, -2.148697, 0, 0, 0, 1, 1,
-1.528907, 0.8179566, 1.3086, 0, 0, 0, 1, 1,
-1.515191, -1.321835, -2.971199, 0, 0, 0, 1, 1,
-1.513048, 0.2947943, -1.931333, 1, 1, 1, 1, 1,
-1.509864, -1.323499, -0.4145715, 1, 1, 1, 1, 1,
-1.507815, -0.07764049, 0.1707432, 1, 1, 1, 1, 1,
-1.501502, -0.2698147, -2.43241, 1, 1, 1, 1, 1,
-1.488885, 0.0005592898, -1.531422, 1, 1, 1, 1, 1,
-1.479496, -1.690356, -2.675468, 1, 1, 1, 1, 1,
-1.478881, -0.7056224, -2.410377, 1, 1, 1, 1, 1,
-1.43286, 0.2518575, -0.4737995, 1, 1, 1, 1, 1,
-1.42557, 1.701244, -3.814117, 1, 1, 1, 1, 1,
-1.406251, -0.391789, -2.224417, 1, 1, 1, 1, 1,
-1.402306, 1.473121, -2.247829, 1, 1, 1, 1, 1,
-1.391446, -0.689946, -1.909495, 1, 1, 1, 1, 1,
-1.379681, -1.328301, -3.435053, 1, 1, 1, 1, 1,
-1.378065, -2.763633, -3.229777, 1, 1, 1, 1, 1,
-1.361027, 1.539391, -2.20552, 1, 1, 1, 1, 1,
-1.358155, -0.5183222, -2.134134, 0, 0, 1, 1, 1,
-1.352838, -1.529442, -1.597126, 1, 0, 0, 1, 1,
-1.349643, 0.4446931, -3.656561, 1, 0, 0, 1, 1,
-1.348773, 0.2785679, -0.8545991, 1, 0, 0, 1, 1,
-1.341824, -0.4608428, -1.086393, 1, 0, 0, 1, 1,
-1.336694, -0.6949168, -2.564553, 1, 0, 0, 1, 1,
-1.336308, -0.646543, -2.693935, 0, 0, 0, 1, 1,
-1.332857, 0.1173202, -0.5085279, 0, 0, 0, 1, 1,
-1.332166, 2.160677, 0.4688195, 0, 0, 0, 1, 1,
-1.329504, -0.90745, -0.4087441, 0, 0, 0, 1, 1,
-1.327361, -1.508349, -3.811399, 0, 0, 0, 1, 1,
-1.324206, 1.721448, -0.7890137, 0, 0, 0, 1, 1,
-1.320657, 0.08190638, -2.809932, 0, 0, 0, 1, 1,
-1.31894, -0.1091317, -0.9992048, 1, 1, 1, 1, 1,
-1.307245, 0.1660831, -3.935616, 1, 1, 1, 1, 1,
-1.305052, -1.342248, -4.23103, 1, 1, 1, 1, 1,
-1.292448, -1.574161, -3.198935, 1, 1, 1, 1, 1,
-1.291072, -1.032687, -2.671752, 1, 1, 1, 1, 1,
-1.286482, 0.7097692, -0.6794401, 1, 1, 1, 1, 1,
-1.281068, -0.547604, -0.4506167, 1, 1, 1, 1, 1,
-1.269244, -2.570627, -3.257068, 1, 1, 1, 1, 1,
-1.269077, -0.0249706, -1.419099, 1, 1, 1, 1, 1,
-1.257595, 0.4848808, 1.093369, 1, 1, 1, 1, 1,
-1.252986, 1.187255, -0.7667675, 1, 1, 1, 1, 1,
-1.247344, 0.4490502, -0.2198821, 1, 1, 1, 1, 1,
-1.238474, 0.7699322, -2.337283, 1, 1, 1, 1, 1,
-1.220376, 1.289452, -2.122917, 1, 1, 1, 1, 1,
-1.219775, -2.113154, -2.252767, 1, 1, 1, 1, 1,
-1.215708, 0.9897485, -0.1469341, 0, 0, 1, 1, 1,
-1.208201, 0.7832162, -0.2390162, 1, 0, 0, 1, 1,
-1.207523, 0.9935391, 1.071738, 1, 0, 0, 1, 1,
-1.202737, 1.477479, -1.601203, 1, 0, 0, 1, 1,
-1.201972, 0.08548498, -1.964976, 1, 0, 0, 1, 1,
-1.199083, 0.287685, -3.501495, 1, 0, 0, 1, 1,
-1.198534, -1.076061, -0.3248401, 0, 0, 0, 1, 1,
-1.193212, 0.606062, -1.010383, 0, 0, 0, 1, 1,
-1.193052, 1.414386, -0.8310036, 0, 0, 0, 1, 1,
-1.192839, -1.039609, -3.760222, 0, 0, 0, 1, 1,
-1.190432, -0.1836634, -2.673707, 0, 0, 0, 1, 1,
-1.183317, 1.341724, 0.8800981, 0, 0, 0, 1, 1,
-1.17873, 0.706237, -1.752658, 0, 0, 0, 1, 1,
-1.175122, -0.8574036, -4.313013, 1, 1, 1, 1, 1,
-1.171106, -0.5458296, -0.7849414, 1, 1, 1, 1, 1,
-1.15952, 1.505795, 0.7309583, 1, 1, 1, 1, 1,
-1.159468, 1.496953, -2.343072, 1, 1, 1, 1, 1,
-1.158362, -0.5819853, -1.677946, 1, 1, 1, 1, 1,
-1.156102, 0.3535848, -3.096294, 1, 1, 1, 1, 1,
-1.15428, 0.2970303, -0.06431024, 1, 1, 1, 1, 1,
-1.153877, 0.3973215, -1.855441, 1, 1, 1, 1, 1,
-1.149067, -1.821417, -4.499355, 1, 1, 1, 1, 1,
-1.139304, 1.446211, 0.9515232, 1, 1, 1, 1, 1,
-1.13792, -1.173362, -1.948367, 1, 1, 1, 1, 1,
-1.132536, 1.422896, -2.963371, 1, 1, 1, 1, 1,
-1.131693, 1.130418, -0.8726268, 1, 1, 1, 1, 1,
-1.128672, -0.855232, -2.174066, 1, 1, 1, 1, 1,
-1.114769, -0.2232483, -2.942425, 1, 1, 1, 1, 1,
-1.109164, -0.7194582, -1.744098, 0, 0, 1, 1, 1,
-1.106306, -0.3161497, -2.624018, 1, 0, 0, 1, 1,
-1.091933, 0.4498587, -1.699522, 1, 0, 0, 1, 1,
-1.091361, -1.084956, -2.624833, 1, 0, 0, 1, 1,
-1.086187, -0.5277209, -1.521713, 1, 0, 0, 1, 1,
-1.085552, 0.4311229, -3.307168, 1, 0, 0, 1, 1,
-1.074759, -0.1758471, -2.084417, 0, 0, 0, 1, 1,
-1.070148, -0.4869244, -2.765295, 0, 0, 0, 1, 1,
-1.069922, 0.4382958, -1.775202, 0, 0, 0, 1, 1,
-1.056735, -0.7561306, -3.229892, 0, 0, 0, 1, 1,
-1.055934, -1.659072, -1.887023, 0, 0, 0, 1, 1,
-1.055671, -0.3304968, -2.621826, 0, 0, 0, 1, 1,
-1.054596, 0.1172724, -2.839276, 0, 0, 0, 1, 1,
-1.040241, -1.732247, 0.07621279, 1, 1, 1, 1, 1,
-1.035789, -1.604251, -2.569221, 1, 1, 1, 1, 1,
-1.033565, -0.231181, -1.001771, 1, 1, 1, 1, 1,
-1.030462, 1.573395, 0.3864075, 1, 1, 1, 1, 1,
-1.030429, 0.4219939, -0.174651, 1, 1, 1, 1, 1,
-1.028768, 0.3391466, -2.535103, 1, 1, 1, 1, 1,
-1.021776, -0.9581655, -2.138836, 1, 1, 1, 1, 1,
-1.014056, 0.7482224, -0.1249707, 1, 1, 1, 1, 1,
-1.013013, -0.3949823, -3.019459, 1, 1, 1, 1, 1,
-1.009699, -0.2909832, -0.6637369, 1, 1, 1, 1, 1,
-1.009537, -1.000534, -3.993247, 1, 1, 1, 1, 1,
-1.006702, -0.06428532, -2.756905, 1, 1, 1, 1, 1,
-1.005942, -0.152015, -0.5513635, 1, 1, 1, 1, 1,
-1.004654, -0.4785584, -2.392905, 1, 1, 1, 1, 1,
-1.000662, 1.239183, -1.642208, 1, 1, 1, 1, 1,
-0.9943175, -0.06817146, -0.3970862, 0, 0, 1, 1, 1,
-0.99327, -0.1752939, -1.371037, 1, 0, 0, 1, 1,
-0.9930472, 0.5474623, -0.2577899, 1, 0, 0, 1, 1,
-0.9901291, -0.4734338, -2.872995, 1, 0, 0, 1, 1,
-0.9833903, -1.368909, -2.361927, 1, 0, 0, 1, 1,
-0.9827346, -0.5695461, -2.265463, 1, 0, 0, 1, 1,
-0.9713203, -2.241034, -2.284574, 0, 0, 0, 1, 1,
-0.9653876, -1.617411, -3.721135, 0, 0, 0, 1, 1,
-0.9573218, 1.222642, 0.9955282, 0, 0, 0, 1, 1,
-0.9568831, -0.01968526, -2.606128, 0, 0, 0, 1, 1,
-0.9556537, 0.2872546, -0.3583391, 0, 0, 0, 1, 1,
-0.9520217, 1.332311, -1.472171, 0, 0, 0, 1, 1,
-0.9490347, -3.068553, -3.9691, 0, 0, 0, 1, 1,
-0.9475697, 1.317848, -0.8254246, 1, 1, 1, 1, 1,
-0.9358337, 1.23717, -0.6502908, 1, 1, 1, 1, 1,
-0.9329243, 0.7010214, 1.075966, 1, 1, 1, 1, 1,
-0.9325812, 0.1528577, -1.228912, 1, 1, 1, 1, 1,
-0.9319628, 0.1249572, -1.32229, 1, 1, 1, 1, 1,
-0.9280282, 0.2804326, -0.8340061, 1, 1, 1, 1, 1,
-0.9256973, -0.3040744, -3.945389, 1, 1, 1, 1, 1,
-0.910857, 0.5207579, 0.8762278, 1, 1, 1, 1, 1,
-0.908471, -0.5869113, -4.14743, 1, 1, 1, 1, 1,
-0.9078733, 1.75241, -2.103065, 1, 1, 1, 1, 1,
-0.9040654, -1.272553, -2.628053, 1, 1, 1, 1, 1,
-0.9033576, 0.1372127, -3.8303, 1, 1, 1, 1, 1,
-0.9010622, -0.3582674, -3.627124, 1, 1, 1, 1, 1,
-0.8993399, -0.2268897, -0.4911557, 1, 1, 1, 1, 1,
-0.8992141, -0.4914804, -4.205438, 1, 1, 1, 1, 1,
-0.8944782, 0.6641774, -0.02915463, 0, 0, 1, 1, 1,
-0.8933588, -0.1453581, -2.000302, 1, 0, 0, 1, 1,
-0.8717285, 1.163328, -0.5201132, 1, 0, 0, 1, 1,
-0.8635235, 1.438794, -0.1852375, 1, 0, 0, 1, 1,
-0.8598264, -0.3966607, -2.970978, 1, 0, 0, 1, 1,
-0.8598128, -0.5593033, -3.908299, 1, 0, 0, 1, 1,
-0.8469685, -0.6632825, -2.337626, 0, 0, 0, 1, 1,
-0.8436275, 1.043055, -1.13114, 0, 0, 0, 1, 1,
-0.8429349, 1.229998, 0.2431794, 0, 0, 0, 1, 1,
-0.841614, 0.1689347, -1.656068, 0, 0, 0, 1, 1,
-0.8413305, 2.135272, -0.1652463, 0, 0, 0, 1, 1,
-0.8350455, 0.2332144, -0.6057356, 0, 0, 0, 1, 1,
-0.830103, 0.6724943, -0.7412689, 0, 0, 0, 1, 1,
-0.8263032, -1.223452, -3.782831, 1, 1, 1, 1, 1,
-0.8249902, 0.01088638, -1.927235, 1, 1, 1, 1, 1,
-0.822551, 0.1886577, -0.8081776, 1, 1, 1, 1, 1,
-0.8174543, 1.74754, 0.4896032, 1, 1, 1, 1, 1,
-0.8163826, -1.873133, -3.399987, 1, 1, 1, 1, 1,
-0.8065786, -0.4661511, -1.831085, 1, 1, 1, 1, 1,
-0.7942171, 0.3054328, -0.08703202, 1, 1, 1, 1, 1,
-0.7925928, 2.105707, -2.074352, 1, 1, 1, 1, 1,
-0.7920766, -0.5134866, -3.551473, 1, 1, 1, 1, 1,
-0.7912761, 3.126647, -1.288883, 1, 1, 1, 1, 1,
-0.7902469, 0.1342352, -0.9430136, 1, 1, 1, 1, 1,
-0.7870784, 0.1566541, -2.100835, 1, 1, 1, 1, 1,
-0.786365, -0.7984185, -2.225489, 1, 1, 1, 1, 1,
-0.7827853, -0.5835764, -2.786569, 1, 1, 1, 1, 1,
-0.7748042, 1.18528, -0.3994576, 1, 1, 1, 1, 1,
-0.7614255, 0.04525808, -0.4367712, 0, 0, 1, 1, 1,
-0.7517669, 0.06503578, 0.7170358, 1, 0, 0, 1, 1,
-0.7501574, -0.3735912, -2.318805, 1, 0, 0, 1, 1,
-0.7485285, 0.3734146, -0.4805928, 1, 0, 0, 1, 1,
-0.7463239, -1.989086, -2.773423, 1, 0, 0, 1, 1,
-0.746069, -0.5876592, -1.813023, 1, 0, 0, 1, 1,
-0.7455794, -0.3327282, -3.13292, 0, 0, 0, 1, 1,
-0.745108, -0.9922121, -2.441385, 0, 0, 0, 1, 1,
-0.7444959, -1.635706, -3.294996, 0, 0, 0, 1, 1,
-0.7387465, -0.2797534, -0.6325493, 0, 0, 0, 1, 1,
-0.7210705, -1.141726, -2.927757, 0, 0, 0, 1, 1,
-0.7192086, -0.5254, -1.21611, 0, 0, 0, 1, 1,
-0.7124794, 1.112574, 0.6773705, 0, 0, 0, 1, 1,
-0.7123575, -0.8642842, -0.8812029, 1, 1, 1, 1, 1,
-0.7096146, -0.08809379, -2.443976, 1, 1, 1, 1, 1,
-0.7062904, -0.6334856, -1.900953, 1, 1, 1, 1, 1,
-0.7043623, 1.267227, -0.2203251, 1, 1, 1, 1, 1,
-0.7007307, -0.7298989, -5.107971, 1, 1, 1, 1, 1,
-0.6975231, -0.3279787, -0.8499969, 1, 1, 1, 1, 1,
-0.6970174, 1.967597, -0.8910245, 1, 1, 1, 1, 1,
-0.696634, -0.6770374, -3.325317, 1, 1, 1, 1, 1,
-0.6948276, -0.9308794, -2.523407, 1, 1, 1, 1, 1,
-0.6909515, 1.854543, -0.1230121, 1, 1, 1, 1, 1,
-0.6907195, -0.6154606, -2.021051, 1, 1, 1, 1, 1,
-0.6838673, 0.4469287, -2.413264, 1, 1, 1, 1, 1,
-0.6827409, -0.1229034, -2.77455, 1, 1, 1, 1, 1,
-0.67838, -0.8610437, -3.420135, 1, 1, 1, 1, 1,
-0.6780627, 0.1288912, -0.1458919, 1, 1, 1, 1, 1,
-0.6750045, 0.2853629, -1.764006, 0, 0, 1, 1, 1,
-0.6738837, 0.5686045, 0.8019384, 1, 0, 0, 1, 1,
-0.6736584, 0.04466241, -3.033795, 1, 0, 0, 1, 1,
-0.6662767, -0.1247191, -1.473323, 1, 0, 0, 1, 1,
-0.6626699, -1.611261, -2.388654, 1, 0, 0, 1, 1,
-0.6626237, -0.3049271, -2.75871, 1, 0, 0, 1, 1,
-0.6617981, 0.7429882, -1.284178, 0, 0, 0, 1, 1,
-0.6541689, 0.009283319, -0.7174146, 0, 0, 0, 1, 1,
-0.6536438, -2.036364, -2.730565, 0, 0, 0, 1, 1,
-0.6531712, 0.7934392, -0.730239, 0, 0, 0, 1, 1,
-0.6483694, -0.2740284, -1.553948, 0, 0, 0, 1, 1,
-0.6459875, -0.5013235, -2.762994, 0, 0, 0, 1, 1,
-0.6393951, -0.1437377, -1.080309, 0, 0, 0, 1, 1,
-0.6378461, 2.050147, -0.5126867, 1, 1, 1, 1, 1,
-0.637108, -1.658735, -4.559729, 1, 1, 1, 1, 1,
-0.6318961, -0.4893843, -2.234239, 1, 1, 1, 1, 1,
-0.6307337, 0.8668099, 0.5801377, 1, 1, 1, 1, 1,
-0.6296838, -1.904307, -2.465554, 1, 1, 1, 1, 1,
-0.6206561, 1.552787, 0.7802337, 1, 1, 1, 1, 1,
-0.6191332, 1.000202, -0.8723781, 1, 1, 1, 1, 1,
-0.6111345, -0.8517556, -2.205287, 1, 1, 1, 1, 1,
-0.6103471, -1.020292, -4.397562, 1, 1, 1, 1, 1,
-0.6084681, -0.03782244, -1.383699, 1, 1, 1, 1, 1,
-0.6082721, -1.820541, -1.881964, 1, 1, 1, 1, 1,
-0.6060064, 0.1725696, -3.073009, 1, 1, 1, 1, 1,
-0.6030777, -1.220792, -1.875837, 1, 1, 1, 1, 1,
-0.5961909, -1.165878, -2.984398, 1, 1, 1, 1, 1,
-0.5926964, -0.9350573, -4.251345, 1, 1, 1, 1, 1,
-0.592362, 0.8988826, 0.3487647, 0, 0, 1, 1, 1,
-0.5845744, 1.069197, -0.05819371, 1, 0, 0, 1, 1,
-0.5812206, 0.4503932, -1.952624, 1, 0, 0, 1, 1,
-0.5736232, 0.9666522, -0.7854425, 1, 0, 0, 1, 1,
-0.5684321, 0.3578099, -1.478455, 1, 0, 0, 1, 1,
-0.5628124, 1.469067, 1.223944, 1, 0, 0, 1, 1,
-0.5439375, -0.4329383, -1.892612, 0, 0, 0, 1, 1,
-0.5436358, 0.09806799, -3.625621, 0, 0, 0, 1, 1,
-0.5386952, -1.077265, -1.915233, 0, 0, 0, 1, 1,
-0.5283366, -0.5662311, -3.77065, 0, 0, 0, 1, 1,
-0.5208703, -0.5082232, -1.649291, 0, 0, 0, 1, 1,
-0.5200129, -0.3155089, -2.227189, 0, 0, 0, 1, 1,
-0.515543, -0.2305163, -2.156461, 0, 0, 0, 1, 1,
-0.510345, -0.07005207, -2.636635, 1, 1, 1, 1, 1,
-0.5091342, 0.4372921, 0.4460545, 1, 1, 1, 1, 1,
-0.5061112, 0.7552261, -0.3360261, 1, 1, 1, 1, 1,
-0.5026594, 0.07370125, -2.521675, 1, 1, 1, 1, 1,
-0.5005268, -0.5299671, -1.989606, 1, 1, 1, 1, 1,
-0.4989504, 0.0406144, -1.80425, 1, 1, 1, 1, 1,
-0.498016, 0.8749773, 0.3437487, 1, 1, 1, 1, 1,
-0.4967458, 1.177565, -0.03347719, 1, 1, 1, 1, 1,
-0.4951647, -0.9890999, -2.602567, 1, 1, 1, 1, 1,
-0.4856738, -0.002299431, -1.263066, 1, 1, 1, 1, 1,
-0.4785335, -0.9166287, -3.136631, 1, 1, 1, 1, 1,
-0.4750223, 1.024071, -1.164812, 1, 1, 1, 1, 1,
-0.4742549, -1.735755, -4.043925, 1, 1, 1, 1, 1,
-0.4703234, 1.10633, 1.47766, 1, 1, 1, 1, 1,
-0.4701923, 2.378267, -1.043503, 1, 1, 1, 1, 1,
-0.4689288, 0.4059608, -0.8921131, 0, 0, 1, 1, 1,
-0.4637971, 1.154765, 1.998723, 1, 0, 0, 1, 1,
-0.4609303, -0.1457535, -2.439611, 1, 0, 0, 1, 1,
-0.4524592, 0.1313916, -1.829872, 1, 0, 0, 1, 1,
-0.4493415, 0.4105972, 0.190211, 1, 0, 0, 1, 1,
-0.4491469, -0.1968047, -1.010088, 1, 0, 0, 1, 1,
-0.4490787, -0.420877, -2.100238, 0, 0, 0, 1, 1,
-0.4484, 0.1657037, -1.293386, 0, 0, 0, 1, 1,
-0.4473864, -0.6238443, -2.982007, 0, 0, 0, 1, 1,
-0.4418113, -0.6347675, -3.187168, 0, 0, 0, 1, 1,
-0.4413448, 0.9384824, -0.7094889, 0, 0, 0, 1, 1,
-0.4400254, -1.437384, -1.82311, 0, 0, 0, 1, 1,
-0.4373423, -1.703091, -1.765192, 0, 0, 0, 1, 1,
-0.4354236, 0.1387124, -1.449412, 1, 1, 1, 1, 1,
-0.4317364, 0.4860327, -0.6147204, 1, 1, 1, 1, 1,
-0.4311694, -0.4579789, -3.304209, 1, 1, 1, 1, 1,
-0.4302221, -1.690597, -1.446479, 1, 1, 1, 1, 1,
-0.4292569, 0.3546671, -0.4431715, 1, 1, 1, 1, 1,
-0.427737, 0.702379, -0.7492411, 1, 1, 1, 1, 1,
-0.4264722, -0.4554691, -2.730728, 1, 1, 1, 1, 1,
-0.4241833, 0.5020239, -0.9122428, 1, 1, 1, 1, 1,
-0.4230105, 0.1225525, -0.8974535, 1, 1, 1, 1, 1,
-0.4223954, 0.1887169, -1.502989, 1, 1, 1, 1, 1,
-0.4137866, -0.4692398, -2.002323, 1, 1, 1, 1, 1,
-0.4079513, 0.9932085, -0.3759007, 1, 1, 1, 1, 1,
-0.4020985, -1.525288, -2.169785, 1, 1, 1, 1, 1,
-0.3967823, -0.8004603, -3.603329, 1, 1, 1, 1, 1,
-0.395532, 1.179198, -1.364668, 1, 1, 1, 1, 1,
-0.3925897, -0.9352466, -2.511331, 0, 0, 1, 1, 1,
-0.3887814, -0.9852395, -3.5212, 1, 0, 0, 1, 1,
-0.3887675, 0.0597821, -1.8773, 1, 0, 0, 1, 1,
-0.3858969, -0.2686489, -1.648773, 1, 0, 0, 1, 1,
-0.3825633, 0.3919643, -1.328725, 1, 0, 0, 1, 1,
-0.3822357, -1.339869, -1.77002, 1, 0, 0, 1, 1,
-0.3808722, -0.9795738, -2.454144, 0, 0, 0, 1, 1,
-0.3750179, -0.8212349, -2.481849, 0, 0, 0, 1, 1,
-0.3663468, 0.1783652, 0.03758061, 0, 0, 0, 1, 1,
-0.3659791, -0.9335486, -4.739387, 0, 0, 0, 1, 1,
-0.3623255, -0.9328191, -2.730951, 0, 0, 0, 1, 1,
-0.3619847, -0.1332454, -3.261099, 0, 0, 0, 1, 1,
-0.3619839, -0.3255705, -1.605338, 0, 0, 0, 1, 1,
-0.3562134, 0.3276847, -0.217052, 1, 1, 1, 1, 1,
-0.3550618, 0.7554991, -0.2253068, 1, 1, 1, 1, 1,
-0.3542683, -0.1264801, -2.603366, 1, 1, 1, 1, 1,
-0.3509316, -1.819952, -4.144493, 1, 1, 1, 1, 1,
-0.349489, 0.4512909, -0.3743589, 1, 1, 1, 1, 1,
-0.3482006, -0.1091635, -1.672104, 1, 1, 1, 1, 1,
-0.3473464, 0.8926015, 0.5967937, 1, 1, 1, 1, 1,
-0.3469879, -0.3084432, -1.113769, 1, 1, 1, 1, 1,
-0.3442861, 0.08495029, -0.9682847, 1, 1, 1, 1, 1,
-0.3414706, -0.04593509, -2.803514, 1, 1, 1, 1, 1,
-0.3392515, -1.364511, -2.550122, 1, 1, 1, 1, 1,
-0.3377018, -0.178476, -2.806038, 1, 1, 1, 1, 1,
-0.3355643, -0.6648775, -3.442187, 1, 1, 1, 1, 1,
-0.3331384, 1.6946, 0.2804559, 1, 1, 1, 1, 1,
-0.3322333, 0.43669, 0.2439212, 1, 1, 1, 1, 1,
-0.3305111, -1.255183, -5.1156, 0, 0, 1, 1, 1,
-0.3263496, 0.4011331, -0.8147537, 1, 0, 0, 1, 1,
-0.3254595, -0.7543044, -1.185369, 1, 0, 0, 1, 1,
-0.3233078, 0.1173096, -2.10955, 1, 0, 0, 1, 1,
-0.3219295, -1.808149, -4.482193, 1, 0, 0, 1, 1,
-0.3190636, 2.751238, 0.4481156, 1, 0, 0, 1, 1,
-0.318535, -0.3388014, -0.5332214, 0, 0, 0, 1, 1,
-0.3166533, 0.2999508, -1.729392, 0, 0, 0, 1, 1,
-0.3134668, -1.589721, -2.81125, 0, 0, 0, 1, 1,
-0.3119334, 0.2759954, -0.5467799, 0, 0, 0, 1, 1,
-0.3088146, -0.2075593, -2.247232, 0, 0, 0, 1, 1,
-0.3039423, 0.3362711, -1.302681, 0, 0, 0, 1, 1,
-0.3025804, -0.9626906, -2.759633, 0, 0, 0, 1, 1,
-0.2974898, -0.4033786, -3.961899, 1, 1, 1, 1, 1,
-0.2963307, -0.211887, -2.361494, 1, 1, 1, 1, 1,
-0.2957373, -0.009750253, -1.151614, 1, 1, 1, 1, 1,
-0.2942231, 1.265406, 0.08231711, 1, 1, 1, 1, 1,
-0.2883356, 0.9095421, 1.899604, 1, 1, 1, 1, 1,
-0.2864209, -1.426368, -3.069774, 1, 1, 1, 1, 1,
-0.2855127, 0.8004716, -0.1856469, 1, 1, 1, 1, 1,
-0.2836002, -0.7609241, -1.352191, 1, 1, 1, 1, 1,
-0.2822222, 1.200809, 0.3703333, 1, 1, 1, 1, 1,
-0.2781765, 0.7079203, -1.154028, 1, 1, 1, 1, 1,
-0.2770873, 0.07880086, -0.09466308, 1, 1, 1, 1, 1,
-0.2749648, 0.3110639, -0.7777317, 1, 1, 1, 1, 1,
-0.2743526, 0.08541299, -0.8795385, 1, 1, 1, 1, 1,
-0.273736, -1.524927, -3.8556, 1, 1, 1, 1, 1,
-0.2735295, -0.8324794, -2.695598, 1, 1, 1, 1, 1,
-0.2722735, 0.3421903, -0.6588715, 0, 0, 1, 1, 1,
-0.2709557, 0.8870052, -1.279654, 1, 0, 0, 1, 1,
-0.2679054, -1.317819, -1.901555, 1, 0, 0, 1, 1,
-0.2659506, -1.008159, -2.842125, 1, 0, 0, 1, 1,
-0.264965, 0.7252909, -1.542661, 1, 0, 0, 1, 1,
-0.264359, 0.4912463, 0.9654653, 1, 0, 0, 1, 1,
-0.2642217, -0.3468261, -2.806206, 0, 0, 0, 1, 1,
-0.2609358, 0.6852872, -1.016317, 0, 0, 0, 1, 1,
-0.2584835, 0.2994697, -0.9442961, 0, 0, 0, 1, 1,
-0.2543046, 1.084142, -0.5841066, 0, 0, 0, 1, 1,
-0.2539949, 0.1863522, -1.755913, 0, 0, 0, 1, 1,
-0.2499646, 0.3331665, 1.648564, 0, 0, 0, 1, 1,
-0.2497464, -0.1134556, -2.621167, 0, 0, 0, 1, 1,
-0.2490618, 1.211523, -1.708447, 1, 1, 1, 1, 1,
-0.2447469, -0.5121965, -2.526625, 1, 1, 1, 1, 1,
-0.2434933, -0.5151506, -3.499238, 1, 1, 1, 1, 1,
-0.2403287, 0.3692278, 0.6115971, 1, 1, 1, 1, 1,
-0.2358838, -0.2285226, -1.597236, 1, 1, 1, 1, 1,
-0.2293334, -2.27016, -1.062921, 1, 1, 1, 1, 1,
-0.228918, 0.867343, -1.283568, 1, 1, 1, 1, 1,
-0.2261432, 1.319673, 1.951579, 1, 1, 1, 1, 1,
-0.2260122, 1.368491, -0.6588118, 1, 1, 1, 1, 1,
-0.2252618, 1.648679, 0.9048089, 1, 1, 1, 1, 1,
-0.2244386, 0.1636732, 0.1494647, 1, 1, 1, 1, 1,
-0.2230807, 0.7448317, -1.019743, 1, 1, 1, 1, 1,
-0.2216861, 0.268446, -1.609312, 1, 1, 1, 1, 1,
-0.217792, -1.153043, -1.921439, 1, 1, 1, 1, 1,
-0.2153543, 0.5686808, 1.000547, 1, 1, 1, 1, 1,
-0.2152514, -0.9159542, -2.898017, 0, 0, 1, 1, 1,
-0.2151039, -1.1022, -2.807992, 1, 0, 0, 1, 1,
-0.2147458, -0.4193774, -3.160119, 1, 0, 0, 1, 1,
-0.2108356, 0.6177683, 0.09389499, 1, 0, 0, 1, 1,
-0.208654, -0.5376382, -2.284786, 1, 0, 0, 1, 1,
-0.2062828, 0.9887021, 1.194112, 1, 0, 0, 1, 1,
-0.2025788, -0.03090576, -2.094305, 0, 0, 0, 1, 1,
-0.1973516, 2.295328, 0.6728595, 0, 0, 0, 1, 1,
-0.1962778, 1.085647, -0.6407387, 0, 0, 0, 1, 1,
-0.1956191, 0.1126425, -1.996147, 0, 0, 0, 1, 1,
-0.1908868, -0.02425425, -1.799933, 0, 0, 0, 1, 1,
-0.1890924, 0.03905758, -0.335356, 0, 0, 0, 1, 1,
-0.1869645, -2.01353, -2.014405, 0, 0, 0, 1, 1,
-0.1863651, 1.925092, 1.583406, 1, 1, 1, 1, 1,
-0.1820896, -0.7289256, -1.905294, 1, 1, 1, 1, 1,
-0.1814972, 1.159771, -0.3332429, 1, 1, 1, 1, 1,
-0.1807099, 0.2197527, -3.343708, 1, 1, 1, 1, 1,
-0.1787345, 0.1040594, -2.565466, 1, 1, 1, 1, 1,
-0.1785503, -0.2680625, -1.953551, 1, 1, 1, 1, 1,
-0.1764583, 0.3410775, -0.576497, 1, 1, 1, 1, 1,
-0.1738145, -1.724562, -2.734502, 1, 1, 1, 1, 1,
-0.1722176, -0.1921055, -3.197492, 1, 1, 1, 1, 1,
-0.1650819, -1.399018, -4.377819, 1, 1, 1, 1, 1,
-0.159523, 0.5568056, 0.8810958, 1, 1, 1, 1, 1,
-0.1575832, 0.2753658, -2.207747, 1, 1, 1, 1, 1,
-0.1553289, -0.4015162, -2.923332, 1, 1, 1, 1, 1,
-0.1493789, 2.359998, -1.200742, 1, 1, 1, 1, 1,
-0.1490671, 0.7954698, 1.229449, 1, 1, 1, 1, 1,
-0.1490211, 1.140439, 1.68349, 0, 0, 1, 1, 1,
-0.1482208, -0.3611702, -4.604789, 1, 0, 0, 1, 1,
-0.14621, -0.8662952, -4.088862, 1, 0, 0, 1, 1,
-0.144862, -0.06342751, -1.328411, 1, 0, 0, 1, 1,
-0.1428381, 0.4104631, -0.08023585, 1, 0, 0, 1, 1,
-0.1372401, -1.373876, -1.02205, 1, 0, 0, 1, 1,
-0.1355605, -0.7169412, -3.460448, 0, 0, 0, 1, 1,
-0.1339792, 1.773909, 1.019756, 0, 0, 0, 1, 1,
-0.1283112, 0.7830446, -0.1675605, 0, 0, 0, 1, 1,
-0.1242208, 0.6787775, -0.968121, 0, 0, 0, 1, 1,
-0.1239374, 2.050824, 1.891944, 0, 0, 0, 1, 1,
-0.122838, 0.6336321, -1.432653, 0, 0, 0, 1, 1,
-0.1221595, -1.33688, -3.331204, 0, 0, 0, 1, 1,
-0.120549, 0.9360328, -2.033061, 1, 1, 1, 1, 1,
-0.1190163, -0.5158889, -2.204784, 1, 1, 1, 1, 1,
-0.1189123, -0.2367329, -4.5872, 1, 1, 1, 1, 1,
-0.1180163, 0.5381583, -0.06364698, 1, 1, 1, 1, 1,
-0.1158823, -2.070529, -2.475728, 1, 1, 1, 1, 1,
-0.1157165, -1.056859, -3.619449, 1, 1, 1, 1, 1,
-0.1144849, -0.5048201, -3.170967, 1, 1, 1, 1, 1,
-0.1137803, -1.417554, -1.426019, 1, 1, 1, 1, 1,
-0.1101857, -0.2823573, -0.3441719, 1, 1, 1, 1, 1,
-0.1098536, -0.9643748, -4.521797, 1, 1, 1, 1, 1,
-0.1098228, 1.69067, 0.02118284, 1, 1, 1, 1, 1,
-0.1062593, -0.9515377, -4.913075, 1, 1, 1, 1, 1,
-0.1058796, 0.8604596, -2.312765, 1, 1, 1, 1, 1,
-0.1057834, -0.5146646, -3.401083, 1, 1, 1, 1, 1,
-0.1055661, -0.7898139, -1.016374, 1, 1, 1, 1, 1,
-0.1011257, 0.08338761, -0.1412864, 0, 0, 1, 1, 1,
-0.1010239, 0.4052948, 0.176992, 1, 0, 0, 1, 1,
-0.1006401, -0.9815584, -4.049195, 1, 0, 0, 1, 1,
-0.100285, 1.356523, 0.7504637, 1, 0, 0, 1, 1,
-0.09947419, 0.3131009, -0.2811476, 1, 0, 0, 1, 1,
-0.09935932, -0.7810093, -3.901205, 1, 0, 0, 1, 1,
-0.0976752, -0.8462039, -1.969451, 0, 0, 0, 1, 1,
-0.09456579, 1.457388, -0.7197278, 0, 0, 0, 1, 1,
-0.09291745, -0.09426863, -1.788373, 0, 0, 0, 1, 1,
-0.09070904, -0.05821415, -2.165435, 0, 0, 0, 1, 1,
-0.08990283, -0.7585184, -3.423335, 0, 0, 0, 1, 1,
-0.08904334, 1.237363, -0.7896625, 0, 0, 0, 1, 1,
-0.08715321, -1.114028, -3.377122, 0, 0, 0, 1, 1,
-0.08176771, -0.7658678, -3.631142, 1, 1, 1, 1, 1,
-0.07812136, 0.5942854, 2.866463, 1, 1, 1, 1, 1,
-0.07649823, -0.9378091, -2.875836, 1, 1, 1, 1, 1,
-0.07619649, 0.8725427, 0.3742355, 1, 1, 1, 1, 1,
-0.07034914, -0.4389899, -3.185057, 1, 1, 1, 1, 1,
-0.06545434, -0.988291, -4.500083, 1, 1, 1, 1, 1,
-0.06383219, 0.5276312, -0.6549968, 1, 1, 1, 1, 1,
-0.06378138, 0.8156812, 0.4655045, 1, 1, 1, 1, 1,
-0.06234983, -0.5896149, -1.875228, 1, 1, 1, 1, 1,
-0.06025169, -1.153138, -3.790687, 1, 1, 1, 1, 1,
-0.0595001, -0.1024069, -2.83593, 1, 1, 1, 1, 1,
-0.05792333, 0.9212829, 0.6376644, 1, 1, 1, 1, 1,
-0.05087097, 1.082306, -1.882642, 1, 1, 1, 1, 1,
-0.04908837, 1.734011, -0.008339423, 1, 1, 1, 1, 1,
-0.04571768, 0.3549554, -0.4519357, 1, 1, 1, 1, 1,
-0.0436151, -1.043968, -3.053594, 0, 0, 1, 1, 1,
-0.04094962, 0.08945487, 0.9956267, 1, 0, 0, 1, 1,
-0.03952206, -0.8319049, -2.073996, 1, 0, 0, 1, 1,
-0.03798843, -0.3031595, -3.252526, 1, 0, 0, 1, 1,
-0.02816826, 1.236368, -0.7139738, 1, 0, 0, 1, 1,
-0.02454665, 1.031062, -0.4063756, 1, 0, 0, 1, 1,
-0.02404905, -1.25386, -2.269473, 0, 0, 0, 1, 1,
-0.02261485, 0.1938716, 0.5728694, 0, 0, 0, 1, 1,
-0.02256295, 1.719556, 0.3418905, 0, 0, 0, 1, 1,
-0.02205838, 0.5856321, -2.298871, 0, 0, 0, 1, 1,
-0.01916723, -1.649314, -3.983932, 0, 0, 0, 1, 1,
-0.01900858, 0.7530517, -1.040251, 0, 0, 0, 1, 1,
-0.0181182, 1.352106, -0.5400254, 0, 0, 0, 1, 1,
-0.0163823, -0.5503231, -3.770663, 1, 1, 1, 1, 1,
-0.01601939, 0.5074012, 0.2950459, 1, 1, 1, 1, 1,
-0.007976164, 0.7892369, 3.051738, 1, 1, 1, 1, 1,
-0.005458519, 0.4288037, -0.391902, 1, 1, 1, 1, 1,
0.0001492045, -1.803996, 3.033937, 1, 1, 1, 1, 1,
0.004981703, 0.9569146, 0.6715466, 1, 1, 1, 1, 1,
0.006292344, 0.1912305, 0.096572, 1, 1, 1, 1, 1,
0.007457518, 0.2624623, -0.4953687, 1, 1, 1, 1, 1,
0.007785184, 0.2192879, 0.02450878, 1, 1, 1, 1, 1,
0.008406094, 0.5035248, -0.1712392, 1, 1, 1, 1, 1,
0.01527021, -2.187504, 2.595639, 1, 1, 1, 1, 1,
0.01664615, 0.5636098, 0.2941171, 1, 1, 1, 1, 1,
0.01778159, -1.357584, 3.118356, 1, 1, 1, 1, 1,
0.02178854, 1.011848, 0.9340698, 1, 1, 1, 1, 1,
0.02186573, 1.589602, -0.06277362, 1, 1, 1, 1, 1,
0.02332631, 0.5816729, 0.04882361, 0, 0, 1, 1, 1,
0.0240958, -1.477932, 3.212571, 1, 0, 0, 1, 1,
0.02737748, 0.1087713, 0.4811856, 1, 0, 0, 1, 1,
0.02949605, -0.002894124, 2.326246, 1, 0, 0, 1, 1,
0.03008729, 0.1152213, -0.929449, 1, 0, 0, 1, 1,
0.03144498, -0.07165159, 2.193054, 1, 0, 0, 1, 1,
0.04018888, 0.7474537, -0.4599787, 0, 0, 0, 1, 1,
0.04108355, -1.031123, 2.725315, 0, 0, 0, 1, 1,
0.04138824, 0.207637, -0.8968397, 0, 0, 0, 1, 1,
0.0417558, 0.7717769, -0.3102782, 0, 0, 0, 1, 1,
0.05205975, -0.3079028, 1.268988, 0, 0, 0, 1, 1,
0.0558695, 0.09533923, -0.2275074, 0, 0, 0, 1, 1,
0.05932732, -1.296104, 4.276488, 0, 0, 0, 1, 1,
0.06163304, 0.2143228, 1.085957, 1, 1, 1, 1, 1,
0.06404514, 0.4184183, 1.127057, 1, 1, 1, 1, 1,
0.06684452, -0.5483884, 3.022749, 1, 1, 1, 1, 1,
0.07146229, -0.8469955, 1.874596, 1, 1, 1, 1, 1,
0.07316954, 0.281516, 0.2389984, 1, 1, 1, 1, 1,
0.07389222, -0.1855892, 3.745689, 1, 1, 1, 1, 1,
0.08010525, 1.182493, 0.4619088, 1, 1, 1, 1, 1,
0.08448722, -0.2986681, 1.689983, 1, 1, 1, 1, 1,
0.08536383, -0.5003882, 4.232608, 1, 1, 1, 1, 1,
0.0860374, -0.6119386, 1.812214, 1, 1, 1, 1, 1,
0.08980627, -0.680895, 3.290313, 1, 1, 1, 1, 1,
0.09056456, -0.1063013, 1.270336, 1, 1, 1, 1, 1,
0.09065756, -0.2089476, 3.65226, 1, 1, 1, 1, 1,
0.09506288, 0.6815718, -0.01040075, 1, 1, 1, 1, 1,
0.09676667, -1.439407, 2.781848, 1, 1, 1, 1, 1,
0.09711759, -0.1252726, 3.090049, 0, 0, 1, 1, 1,
0.09865157, -0.7892271, 3.525598, 1, 0, 0, 1, 1,
0.1061308, -1.038028, 4.461998, 1, 0, 0, 1, 1,
0.1096597, 1.156811, -2.57698, 1, 0, 0, 1, 1,
0.110632, -0.2783632, 2.590695, 1, 0, 0, 1, 1,
0.1132229, -0.6106851, 4.558018, 1, 0, 0, 1, 1,
0.1164162, -0.8297389, 2.847856, 0, 0, 0, 1, 1,
0.1170697, 0.7801565, 1.911276, 0, 0, 0, 1, 1,
0.119078, 0.04802391, 0.6312864, 0, 0, 0, 1, 1,
0.1267301, -1.768665, 3.187284, 0, 0, 0, 1, 1,
0.134335, 0.4678975, -0.2478057, 0, 0, 0, 1, 1,
0.1352867, -0.8005748, 4.639432, 0, 0, 0, 1, 1,
0.1381619, -0.3439288, 3.012485, 0, 0, 0, 1, 1,
0.1381895, 0.2900561, -0.2814908, 1, 1, 1, 1, 1,
0.1409187, 0.3260408, 0.2896581, 1, 1, 1, 1, 1,
0.1429662, -0.7471535, 2.205682, 1, 1, 1, 1, 1,
0.1516082, 0.05977697, 2.477926, 1, 1, 1, 1, 1,
0.15588, -1.535231, 3.78859, 1, 1, 1, 1, 1,
0.1560523, -0.5419895, 2.952919, 1, 1, 1, 1, 1,
0.1590252, -1.116944, 2.118644, 1, 1, 1, 1, 1,
0.1623144, -1.701859, 1.330266, 1, 1, 1, 1, 1,
0.1642468, -2.375327, 3.630475, 1, 1, 1, 1, 1,
0.1713546, -0.1060839, 3.574302, 1, 1, 1, 1, 1,
0.1775073, 0.03279337, 0.4476947, 1, 1, 1, 1, 1,
0.1776246, -0.8905941, 4.28253, 1, 1, 1, 1, 1,
0.1782758, 1.450258, 0.6580825, 1, 1, 1, 1, 1,
0.1796089, -0.8742625, 1.475639, 1, 1, 1, 1, 1,
0.1803932, -0.3820539, 3.605098, 1, 1, 1, 1, 1,
0.1831563, 0.8934908, 0.07637325, 0, 0, 1, 1, 1,
0.1866155, 0.06002126, 2.488379, 1, 0, 0, 1, 1,
0.1981785, 1.010496, 0.3388604, 1, 0, 0, 1, 1,
0.1983192, 0.1206963, 1.370815, 1, 0, 0, 1, 1,
0.2030479, -0.3637031, 3.504608, 1, 0, 0, 1, 1,
0.2050455, 0.7293079, 0.8078659, 1, 0, 0, 1, 1,
0.2064154, 0.308124, -0.7286308, 0, 0, 0, 1, 1,
0.2082807, 0.4367936, 0.02784731, 0, 0, 0, 1, 1,
0.2096801, 0.6794092, -2.149969, 0, 0, 0, 1, 1,
0.2104493, -1.344979, 2.763664, 0, 0, 0, 1, 1,
0.2176094, -0.611209, 3.126852, 0, 0, 0, 1, 1,
0.2190778, 1.264475, 0.7799458, 0, 0, 0, 1, 1,
0.2248468, 0.1697411, 0.4969793, 0, 0, 0, 1, 1,
0.2283821, 1.159177, 1.059143, 1, 1, 1, 1, 1,
0.2298972, -0.3764864, 3.025281, 1, 1, 1, 1, 1,
0.2313504, -0.5994086, 1.916726, 1, 1, 1, 1, 1,
0.231408, 0.3817762, 0.6994264, 1, 1, 1, 1, 1,
0.2337915, 0.4566702, 2.436341, 1, 1, 1, 1, 1,
0.2362628, 1.623518, 0.7189282, 1, 1, 1, 1, 1,
0.2383861, -0.6242054, 3.039486, 1, 1, 1, 1, 1,
0.2401309, 0.9633049, 0.3466174, 1, 1, 1, 1, 1,
0.2436134, -0.7705815, 4.992127, 1, 1, 1, 1, 1,
0.2463441, 0.3377109, 0.925916, 1, 1, 1, 1, 1,
0.2504522, -0.048964, -0.04539467, 1, 1, 1, 1, 1,
0.2509949, 0.1421594, 1.433713, 1, 1, 1, 1, 1,
0.2517456, -0.933791, 3.387848, 1, 1, 1, 1, 1,
0.2549244, -0.4363362, 2.297597, 1, 1, 1, 1, 1,
0.2552357, -0.825313, 2.664699, 1, 1, 1, 1, 1,
0.2572371, -1.347343, 4.070632, 0, 0, 1, 1, 1,
0.2626059, -0.09866378, 1.216735, 1, 0, 0, 1, 1,
0.2638104, -0.3143198, 2.544237, 1, 0, 0, 1, 1,
0.2719229, -1.761471, 1.159263, 1, 0, 0, 1, 1,
0.2728316, 0.2000479, 0.3400822, 1, 0, 0, 1, 1,
0.2756808, -0.9295307, 1.604365, 1, 0, 0, 1, 1,
0.2818763, -1.028422, 3.423163, 0, 0, 0, 1, 1,
0.2818844, 1.152355, 0.2444334, 0, 0, 0, 1, 1,
0.2824601, 0.08885346, 0.283659, 0, 0, 0, 1, 1,
0.2853211, -0.5724636, 0.5945635, 0, 0, 0, 1, 1,
0.2862721, -0.4837281, 2.963736, 0, 0, 0, 1, 1,
0.2952508, -0.109608, 1.125198, 0, 0, 0, 1, 1,
0.3023878, 1.86261, 0.1249841, 0, 0, 0, 1, 1,
0.3050851, -0.2547152, 1.306091, 1, 1, 1, 1, 1,
0.306814, 0.3193749, 0.7356822, 1, 1, 1, 1, 1,
0.3102374, 0.9142301, -0.1949988, 1, 1, 1, 1, 1,
0.3203953, -0.6634205, 2.621524, 1, 1, 1, 1, 1,
0.3229662, 1.61135, 1.009598, 1, 1, 1, 1, 1,
0.3278509, -1.480394, 4.613093, 1, 1, 1, 1, 1,
0.3312081, 0.9949446, -0.7603891, 1, 1, 1, 1, 1,
0.3316289, 2.181743, -0.359053, 1, 1, 1, 1, 1,
0.3319144, -1.65521, 3.557506, 1, 1, 1, 1, 1,
0.3319336, 1.453101, 0.6793238, 1, 1, 1, 1, 1,
0.3338811, 0.8260301, 0.00112442, 1, 1, 1, 1, 1,
0.3373708, -0.1784617, 1.723452, 1, 1, 1, 1, 1,
0.3374017, -0.5240059, 4.901566, 1, 1, 1, 1, 1,
0.3426229, -1.481669, 0.9001986, 1, 1, 1, 1, 1,
0.3477663, -1.272888, 1.937085, 1, 1, 1, 1, 1,
0.3530737, 0.1520194, 0.381431, 0, 0, 1, 1, 1,
0.3558978, 1.133377, 0.2343254, 1, 0, 0, 1, 1,
0.3561372, -0.05089941, 1.543856, 1, 0, 0, 1, 1,
0.3585433, -1.065608, 4.259161, 1, 0, 0, 1, 1,
0.3625876, 1.774679, 0.98859, 1, 0, 0, 1, 1,
0.368495, -1.594107, 2.549613, 1, 0, 0, 1, 1,
0.3685423, -0.5397484, 4.582651, 0, 0, 0, 1, 1,
0.3764499, 0.9188748, 1.157018, 0, 0, 0, 1, 1,
0.3830006, -1.317998, 2.157794, 0, 0, 0, 1, 1,
0.3857136, 0.9590983, -0.9861999, 0, 0, 0, 1, 1,
0.3883294, 0.6994155, -0.8685843, 0, 0, 0, 1, 1,
0.3886943, -0.7243749, 3.888233, 0, 0, 0, 1, 1,
0.3927264, -0.2918377, 2.041373, 0, 0, 0, 1, 1,
0.3939942, 2.291535, 2.203135, 1, 1, 1, 1, 1,
0.4008759, 0.5551761, -0.5252154, 1, 1, 1, 1, 1,
0.4022164, 0.7394335, 0.2245608, 1, 1, 1, 1, 1,
0.4056243, -1.109432, 3.900108, 1, 1, 1, 1, 1,
0.4061593, 0.6678331, 1.092298, 1, 1, 1, 1, 1,
0.4108225, 0.5590988, -0.3253792, 1, 1, 1, 1, 1,
0.4111269, 1.827396, 0.2957346, 1, 1, 1, 1, 1,
0.4175148, 0.9445927, 2.001238, 1, 1, 1, 1, 1,
0.4197558, 0.1984954, 0.7611979, 1, 1, 1, 1, 1,
0.421019, -0.356598, 2.966831, 1, 1, 1, 1, 1,
0.4224008, 0.2362921, 1.245081, 1, 1, 1, 1, 1,
0.4296502, -0.6221713, 2.805979, 1, 1, 1, 1, 1,
0.4320789, 1.765087, 2.382273, 1, 1, 1, 1, 1,
0.4344198, -0.1691083, 1.231993, 1, 1, 1, 1, 1,
0.4367354, 0.9939147, -2.308645, 1, 1, 1, 1, 1,
0.4394438, -0.08787925, 1.190061, 0, 0, 1, 1, 1,
0.4395857, 0.3298313, -1.812069, 1, 0, 0, 1, 1,
0.4402202, -1.09995, 1.58054, 1, 0, 0, 1, 1,
0.4405988, -1.790376, 1.91663, 1, 0, 0, 1, 1,
0.4431261, 0.03320432, 2.246197, 1, 0, 0, 1, 1,
0.4443336, -0.1084661, 0.6783673, 1, 0, 0, 1, 1,
0.4455274, 0.5268787, 1.859647, 0, 0, 0, 1, 1,
0.4485843, 0.6676036, 0.1379138, 0, 0, 0, 1, 1,
0.4496782, -0.5475894, 2.076373, 0, 0, 0, 1, 1,
0.4518831, 0.1760978, 1.756769, 0, 0, 0, 1, 1,
0.4679848, -1.308332, 4.663678, 0, 0, 0, 1, 1,
0.4751098, 2.191483, -2.17216, 0, 0, 0, 1, 1,
0.4757763, 0.6967954, 0.7627091, 0, 0, 0, 1, 1,
0.4775864, -0.03193399, 1.249621, 1, 1, 1, 1, 1,
0.4805079, 0.4480769, 2.734482, 1, 1, 1, 1, 1,
0.4896161, -1.095027, 3.750314, 1, 1, 1, 1, 1,
0.4978781, -0.8055491, 3.868978, 1, 1, 1, 1, 1,
0.500245, -0.5386617, 3.083673, 1, 1, 1, 1, 1,
0.5091084, 0.07045507, 2.124628, 1, 1, 1, 1, 1,
0.5096151, -1.273075, 0.5927084, 1, 1, 1, 1, 1,
0.5112643, -0.2518525, 0.7991439, 1, 1, 1, 1, 1,
0.5124262, 0.8434669, 2.69803, 1, 1, 1, 1, 1,
0.5133379, -0.3031091, 2.16913, 1, 1, 1, 1, 1,
0.5145862, 0.1915711, 2.570045, 1, 1, 1, 1, 1,
0.5154351, 1.099054, 0.8463945, 1, 1, 1, 1, 1,
0.5166449, -0.498831, 2.072425, 1, 1, 1, 1, 1,
0.5176659, -0.9703121, 1.839591, 1, 1, 1, 1, 1,
0.518296, -0.5155575, 2.763416, 1, 1, 1, 1, 1,
0.5205245, 1.377966, -0.1499489, 0, 0, 1, 1, 1,
0.5208622, -0.291836, 2.653969, 1, 0, 0, 1, 1,
0.5240489, -0.2747706, 3.086143, 1, 0, 0, 1, 1,
0.5279495, 0.3315578, 1.09121, 1, 0, 0, 1, 1,
0.5324929, -1.318716, 2.796378, 1, 0, 0, 1, 1,
0.5337973, 0.7900784, -0.04868256, 1, 0, 0, 1, 1,
0.535887, -2.132244, 3.796314, 0, 0, 0, 1, 1,
0.5372112, 1.179644, -0.5794639, 0, 0, 0, 1, 1,
0.5376139, 1.414038, 1.382134, 0, 0, 0, 1, 1,
0.5389054, -1.588793, 1.702499, 0, 0, 0, 1, 1,
0.5423058, -2.692507, 4.093628, 0, 0, 0, 1, 1,
0.5423959, -0.132066, 2.192129, 0, 0, 0, 1, 1,
0.5442688, 1.207049, 0.9509212, 0, 0, 0, 1, 1,
0.5454293, -0.002957049, 1.416387, 1, 1, 1, 1, 1,
0.5454695, 0.7211584, 0.7071939, 1, 1, 1, 1, 1,
0.545504, 0.1975648, 0.1962174, 1, 1, 1, 1, 1,
0.5473704, -1.066277, 3.888424, 1, 1, 1, 1, 1,
0.5569556, 1.041657, 0.1391997, 1, 1, 1, 1, 1,
0.5586478, -1.913728, 2.532144, 1, 1, 1, 1, 1,
0.5687823, 0.2113994, 1.138525, 1, 1, 1, 1, 1,
0.5700201, 0.1090097, -0.05105982, 1, 1, 1, 1, 1,
0.5704458, 0.0196729, 1.81828, 1, 1, 1, 1, 1,
0.5718904, 0.3452175, -0.9109383, 1, 1, 1, 1, 1,
0.5720147, 1.297585, 1.137581, 1, 1, 1, 1, 1,
0.5770887, 0.6423463, 0.4673097, 1, 1, 1, 1, 1,
0.5784661, -1.151181, 1.407061, 1, 1, 1, 1, 1,
0.5791891, -0.3212983, 2.667763, 1, 1, 1, 1, 1,
0.5805479, 0.3846847, 1.95164, 1, 1, 1, 1, 1,
0.5839586, 0.605313, -0.4980182, 0, 0, 1, 1, 1,
0.5846494, -0.3401097, 2.322247, 1, 0, 0, 1, 1,
0.5868758, -0.4156113, 2.551163, 1, 0, 0, 1, 1,
0.5873634, -1.310611, 4.739246, 1, 0, 0, 1, 1,
0.5888177, -1.195078, 1.667116, 1, 0, 0, 1, 1,
0.5915582, 0.2910202, 1.400195, 1, 0, 0, 1, 1,
0.5956994, -0.7252216, 1.562846, 0, 0, 0, 1, 1,
0.6039413, 0.1590418, 0.5809795, 0, 0, 0, 1, 1,
0.6073313, -1.684345, 2.033775, 0, 0, 0, 1, 1,
0.6088551, 1.00006, 1.747639, 0, 0, 0, 1, 1,
0.6106312, -0.3206001, 3.348463, 0, 0, 0, 1, 1,
0.6146271, 0.1238463, 2.147288, 0, 0, 0, 1, 1,
0.620761, 0.3560482, 2.262474, 0, 0, 0, 1, 1,
0.621711, -0.3958172, 2.241532, 1, 1, 1, 1, 1,
0.6224491, -1.547224, 3.700125, 1, 1, 1, 1, 1,
0.6238944, 0.1937245, 2.394595, 1, 1, 1, 1, 1,
0.6281697, -0.2508439, 2.192711, 1, 1, 1, 1, 1,
0.628549, -0.5357192, 3.048033, 1, 1, 1, 1, 1,
0.6291119, 1.022424, -0.222853, 1, 1, 1, 1, 1,
0.6296635, -0.3879352, 4.003862, 1, 1, 1, 1, 1,
0.6298159, -1.67073, 2.61251, 1, 1, 1, 1, 1,
0.6320858, -1.112252, 3.037901, 1, 1, 1, 1, 1,
0.6367548, -0.277942, 1.513244, 1, 1, 1, 1, 1,
0.6382004, 0.06893609, 2.660049, 1, 1, 1, 1, 1,
0.6407204, -0.384525, 2.440749, 1, 1, 1, 1, 1,
0.6488929, -0.5511314, 2.190179, 1, 1, 1, 1, 1,
0.6492729, 0.3120901, 2.712569, 1, 1, 1, 1, 1,
0.6494524, 0.9268954, 1.290336, 1, 1, 1, 1, 1,
0.6500819, 1.0654, -0.7476059, 0, 0, 1, 1, 1,
0.652037, 2.524082, 0.7275117, 1, 0, 0, 1, 1,
0.6525826, 0.7774497, 1.807534, 1, 0, 0, 1, 1,
0.6582618, -0.6207722, 2.093187, 1, 0, 0, 1, 1,
0.6643648, -1.16903, 2.475371, 1, 0, 0, 1, 1,
0.6669036, -1.569806, 2.306284, 1, 0, 0, 1, 1,
0.6709823, -0.5870771, 3.173039, 0, 0, 0, 1, 1,
0.6728577, -1.218952, 4.181901, 0, 0, 0, 1, 1,
0.6758578, 0.7112914, -0.338574, 0, 0, 0, 1, 1,
0.6763606, 0.4850848, 0.08984014, 0, 0, 0, 1, 1,
0.6796989, 0.8473884, 1.440467, 0, 0, 0, 1, 1,
0.6844345, 0.5425434, -0.05102623, 0, 0, 0, 1, 1,
0.6935303, -0.3862252, 3.472088, 0, 0, 0, 1, 1,
0.6935324, -1.219187, 1.012137, 1, 1, 1, 1, 1,
0.6952343, 1.309584, 2.185726, 1, 1, 1, 1, 1,
0.6969345, -0.03979139, 1.757983, 1, 1, 1, 1, 1,
0.705813, 0.05883201, 0.4251867, 1, 1, 1, 1, 1,
0.7068281, 1.166112, 1.423561, 1, 1, 1, 1, 1,
0.7140324, 1.922178, 1.102587, 1, 1, 1, 1, 1,
0.7142241, -1.324457, 2.964323, 1, 1, 1, 1, 1,
0.7154288, -0.3273199, -0.1232604, 1, 1, 1, 1, 1,
0.7260479, -0.6972574, 1.756108, 1, 1, 1, 1, 1,
0.7342147, 0.4293332, 2.856724, 1, 1, 1, 1, 1,
0.742899, -1.299124, 4.333734, 1, 1, 1, 1, 1,
0.7439706, -0.2779356, 0.3573577, 1, 1, 1, 1, 1,
0.7448386, -0.01484911, 3.202677, 1, 1, 1, 1, 1,
0.7579081, -1.214256, 1.753151, 1, 1, 1, 1, 1,
0.7604212, 0.7980469, 0.2073221, 1, 1, 1, 1, 1,
0.7644793, 1.708897, 0.9372803, 0, 0, 1, 1, 1,
0.7671482, -1.625593, 2.465906, 1, 0, 0, 1, 1,
0.7691467, 0.4842299, -0.9434657, 1, 0, 0, 1, 1,
0.7773296, -0.4217558, 2.330433, 1, 0, 0, 1, 1,
0.7781625, -0.2754104, 2.05344, 1, 0, 0, 1, 1,
0.7806135, 1.718918, -1.280212, 1, 0, 0, 1, 1,
0.793582, 0.5264081, 0.645362, 0, 0, 0, 1, 1,
0.7937566, -0.2652664, 1.780012, 0, 0, 0, 1, 1,
0.8001878, 0.05086274, 1.462947, 0, 0, 0, 1, 1,
0.802686, -0.1412939, 0.2933215, 0, 0, 0, 1, 1,
0.809077, 0.2678039, 1.799503, 0, 0, 0, 1, 1,
0.8121654, -0.1471666, 1.885984, 0, 0, 0, 1, 1,
0.8127432, -1.94159, 1.84978, 0, 0, 0, 1, 1,
0.813304, 0.8581595, -1.535327, 1, 1, 1, 1, 1,
0.8164902, 0.1203573, 1.759936, 1, 1, 1, 1, 1,
0.8206106, 2.282362, 2.473387, 1, 1, 1, 1, 1,
0.8243597, 0.1289091, 2.231963, 1, 1, 1, 1, 1,
0.825266, -0.6878209, 3.605434, 1, 1, 1, 1, 1,
0.8255233, -0.1378913, 2.083696, 1, 1, 1, 1, 1,
0.8255518, 0.7814939, 1.370909, 1, 1, 1, 1, 1,
0.8304406, -0.001210082, -0.6876303, 1, 1, 1, 1, 1,
0.8318377, -1.442214, 1.752483, 1, 1, 1, 1, 1,
0.8320812, -1.137787, 2.095881, 1, 1, 1, 1, 1,
0.8329719, 1.491567, 0.6263367, 1, 1, 1, 1, 1,
0.8391255, 0.08596534, 0.4265318, 1, 1, 1, 1, 1,
0.8392079, 1.621144, 1.489668, 1, 1, 1, 1, 1,
0.8399102, -0.0186506, 2.175685, 1, 1, 1, 1, 1,
0.8452194, 0.05635692, 2.32862, 1, 1, 1, 1, 1,
0.8482277, -0.6957842, 2.302881, 0, 0, 1, 1, 1,
0.8502318, -0.6442745, 4.458107, 1, 0, 0, 1, 1,
0.8525723, -0.552798, 2.060553, 1, 0, 0, 1, 1,
0.8541012, -0.7027723, 1.510217, 1, 0, 0, 1, 1,
0.8578954, -0.7310255, 3.817402, 1, 0, 0, 1, 1,
0.8598027, 0.8130584, -0.665773, 1, 0, 0, 1, 1,
0.8636025, 0.05087161, 1.764795, 0, 0, 0, 1, 1,
0.8703628, -1.616175, 2.603105, 0, 0, 0, 1, 1,
0.8742308, 0.002165441, 0.3013568, 0, 0, 0, 1, 1,
0.8746573, 0.3765587, 3.630869, 0, 0, 0, 1, 1,
0.8941494, -0.644487, 3.107007, 0, 0, 0, 1, 1,
0.8996057, -0.546639, 2.656475, 0, 0, 0, 1, 1,
0.9004439, 0.4864452, 0.8643352, 0, 0, 0, 1, 1,
0.9046511, 0.4743503, 0.5020945, 1, 1, 1, 1, 1,
0.9073765, 1.771608, 0.7105762, 1, 1, 1, 1, 1,
0.9100223, 1.641984, -0.8011783, 1, 1, 1, 1, 1,
0.9106871, -0.2789834, 1.98179, 1, 1, 1, 1, 1,
0.9113597, 1.135051, 1.209922, 1, 1, 1, 1, 1,
0.9126358, 0.6725825, 2.73496, 1, 1, 1, 1, 1,
0.9160185, 0.9526993, 0.1594584, 1, 1, 1, 1, 1,
0.928351, 1.662452, 1.345696, 1, 1, 1, 1, 1,
0.9402712, -0.1273486, 1.423322, 1, 1, 1, 1, 1,
0.9408905, -0.8926618, 2.723309, 1, 1, 1, 1, 1,
0.944577, 0.609455, 2.039768, 1, 1, 1, 1, 1,
0.9454276, 0.9922391, 1.53078, 1, 1, 1, 1, 1,
0.9562438, 0.7799578, -0.5285387, 1, 1, 1, 1, 1,
0.9579026, -0.7581943, 2.126255, 1, 1, 1, 1, 1,
0.9687175, 0.7965755, 0.4936281, 1, 1, 1, 1, 1,
0.9710539, -0.5251562, 2.352667, 0, 0, 1, 1, 1,
0.9719624, -0.456301, 2.105206, 1, 0, 0, 1, 1,
0.9728698, 0.0938359, -0.04206846, 1, 0, 0, 1, 1,
0.9845597, -0.04566655, 0.5897557, 1, 0, 0, 1, 1,
0.9914042, -1.187375, 0.9282838, 1, 0, 0, 1, 1,
0.9941324, -0.7706438, 4.399722, 1, 0, 0, 1, 1,
0.996779, -0.6813618, 0.6421487, 0, 0, 0, 1, 1,
0.9974611, -0.988625, 2.066889, 0, 0, 0, 1, 1,
0.9994806, -0.5299324, 2.69703, 0, 0, 0, 1, 1,
1.003603, -0.9686878, 3.427761, 0, 0, 0, 1, 1,
1.00376, 0.6983636, 1.489868, 0, 0, 0, 1, 1,
1.008907, 0.9806117, 0.862137, 0, 0, 0, 1, 1,
1.009738, 1.202036, 1.754299, 0, 0, 0, 1, 1,
1.019355, 1.820122, -0.1600584, 1, 1, 1, 1, 1,
1.020311, -1.780316, 2.739583, 1, 1, 1, 1, 1,
1.022119, -1.785202, 2.498245, 1, 1, 1, 1, 1,
1.022864, -0.9771694, 1.688584, 1, 1, 1, 1, 1,
1.031596, 1.426998, 1.030564, 1, 1, 1, 1, 1,
1.03721, -0.0244035, 1.097324, 1, 1, 1, 1, 1,
1.060852, -1.295314, 2.575976, 1, 1, 1, 1, 1,
1.06658, 0.3522125, 0.2673029, 1, 1, 1, 1, 1,
1.078281, -0.2373955, 0.4557583, 1, 1, 1, 1, 1,
1.079235, -0.9237592, 2.112833, 1, 1, 1, 1, 1,
1.086923, -1.147191, 3.445413, 1, 1, 1, 1, 1,
1.091637, 1.696662, 0.9073448, 1, 1, 1, 1, 1,
1.094218, 0.7079867, 3.113208, 1, 1, 1, 1, 1,
1.108945, -0.4787573, 2.503919, 1, 1, 1, 1, 1,
1.122046, 2.223946, -0.09381175, 1, 1, 1, 1, 1,
1.123924, -1.512375, 2.223226, 0, 0, 1, 1, 1,
1.131383, -0.4123214, 1.845157, 1, 0, 0, 1, 1,
1.134913, -0.9688776, 3.251554, 1, 0, 0, 1, 1,
1.139192, 0.9913636, 2.239608, 1, 0, 0, 1, 1,
1.143889, 0.2921482, -0.5145363, 1, 0, 0, 1, 1,
1.153346, 0.01486367, 0.7111396, 1, 0, 0, 1, 1,
1.15386, 1.021993, 0.3811267, 0, 0, 0, 1, 1,
1.15426, 0.1074373, 2.220099, 0, 0, 0, 1, 1,
1.161694, 0.2576415, 0.8725818, 0, 0, 0, 1, 1,
1.164045, -1.696358, 1.727197, 0, 0, 0, 1, 1,
1.16747, -0.1294575, 1.611025, 0, 0, 0, 1, 1,
1.16902, -0.03256772, 2.153105, 0, 0, 0, 1, 1,
1.171107, -0.3754656, 2.411152, 0, 0, 0, 1, 1,
1.172634, -0.4418671, 2.852042, 1, 1, 1, 1, 1,
1.184181, 0.5470421, 1.892745, 1, 1, 1, 1, 1,
1.184259, 1.871053, -0.5281221, 1, 1, 1, 1, 1,
1.186575, -1.509818, 1.032568, 1, 1, 1, 1, 1,
1.188759, 1.316724, 1.083434, 1, 1, 1, 1, 1,
1.189761, 0.6663065, 0.5590399, 1, 1, 1, 1, 1,
1.193534, -0.7477769, 1.534799, 1, 1, 1, 1, 1,
1.194969, 0.8450424, -0.2700225, 1, 1, 1, 1, 1,
1.196174, 0.1271065, 0.96222, 1, 1, 1, 1, 1,
1.198412, -0.8306665, 0.9618894, 1, 1, 1, 1, 1,
1.209847, -0.8605444, 0.9355624, 1, 1, 1, 1, 1,
1.221009, 0.1258199, 0.9203611, 1, 1, 1, 1, 1,
1.223685, 0.3872091, 2.310461, 1, 1, 1, 1, 1,
1.226232, 0.2673076, 1.795737, 1, 1, 1, 1, 1,
1.227864, -1.606496, 3.795851, 1, 1, 1, 1, 1,
1.23002, -1.762078, 3.46528, 0, 0, 1, 1, 1,
1.233152, 0.1089364, 2.361066, 1, 0, 0, 1, 1,
1.235289, -0.5609219, 0.7276257, 1, 0, 0, 1, 1,
1.236745, -0.3305246, 2.309352, 1, 0, 0, 1, 1,
1.245465, 0.5290836, 0.534263, 1, 0, 0, 1, 1,
1.261344, 2.100544, -0.8785893, 1, 0, 0, 1, 1,
1.262516, -0.1860023, 3.500661, 0, 0, 0, 1, 1,
1.268017, -0.0880008, 1.006143, 0, 0, 0, 1, 1,
1.269681, -0.1449682, 1.290157, 0, 0, 0, 1, 1,
1.272198, -1.901495, 1.368395, 0, 0, 0, 1, 1,
1.277865, 0.4194238, 1.503115, 0, 0, 0, 1, 1,
1.281144, -0.7430291, 2.832126, 0, 0, 0, 1, 1,
1.285809, -0.2020212, 1.802135, 0, 0, 0, 1, 1,
1.291131, -0.09602045, 2.250174, 1, 1, 1, 1, 1,
1.30725, 0.157193, 0.4184744, 1, 1, 1, 1, 1,
1.309968, -0.3739165, 2.163481, 1, 1, 1, 1, 1,
1.310695, 0.09254196, 1.440922, 1, 1, 1, 1, 1,
1.312813, -0.1882604, 3.138269, 1, 1, 1, 1, 1,
1.314357, 0.6866989, 0.735172, 1, 1, 1, 1, 1,
1.318952, -0.6287957, 0.9665656, 1, 1, 1, 1, 1,
1.319149, -0.2314759, 2.811969, 1, 1, 1, 1, 1,
1.319823, -0.3825513, 2.397924, 1, 1, 1, 1, 1,
1.326441, -0.5490912, 1.658726, 1, 1, 1, 1, 1,
1.330948, 0.6269494, 2.36671, 1, 1, 1, 1, 1,
1.33547, 0.5431095, -0.08447208, 1, 1, 1, 1, 1,
1.340049, 0.140631, 1.288096, 1, 1, 1, 1, 1,
1.343289, 1.031172, -0.8759353, 1, 1, 1, 1, 1,
1.343902, -0.09830181, 1.482225, 1, 1, 1, 1, 1,
1.344675, 2.522744, -0.1082365, 0, 0, 1, 1, 1,
1.34947, 0.3452615, 3.363918, 1, 0, 0, 1, 1,
1.370739, 0.8555462, 0.01895319, 1, 0, 0, 1, 1,
1.375386, 0.3001097, 4.278852, 1, 0, 0, 1, 1,
1.384559, 1.028724, 1.968015, 1, 0, 0, 1, 1,
1.387977, 0.9282658, -0.4929543, 1, 0, 0, 1, 1,
1.390449, -0.3664745, 3.067457, 0, 0, 0, 1, 1,
1.392958, -1.019247, 3.094189, 0, 0, 0, 1, 1,
1.407652, -1.042971, 2.6761, 0, 0, 0, 1, 1,
1.419859, 1.253776, 0.6983026, 0, 0, 0, 1, 1,
1.420228, -0.7862851, 2.329641, 0, 0, 0, 1, 1,
1.425164, -0.175511, 2.284316, 0, 0, 0, 1, 1,
1.426754, -0.4384669, 3.456899, 0, 0, 0, 1, 1,
1.435724, -1.927985, 2.456008, 1, 1, 1, 1, 1,
1.437912, 1.153334, 2.029259, 1, 1, 1, 1, 1,
1.43907, 1.292533, -0.1838969, 1, 1, 1, 1, 1,
1.441975, 0.6919444, 2.008523, 1, 1, 1, 1, 1,
1.44859, -1.369774, 2.311879, 1, 1, 1, 1, 1,
1.45396, 0.921077, 1.415527, 1, 1, 1, 1, 1,
1.481477, -0.1934225, 2.024379, 1, 1, 1, 1, 1,
1.483681, 0.4170333, -1.397266, 1, 1, 1, 1, 1,
1.500477, -1.135511, 2.589298, 1, 1, 1, 1, 1,
1.503999, 1.202085, -1.082374, 1, 1, 1, 1, 1,
1.518819, -0.9944881, 1.399936, 1, 1, 1, 1, 1,
1.528295, -0.3102248, 3.721589, 1, 1, 1, 1, 1,
1.533227, -1.286364, 3.307552, 1, 1, 1, 1, 1,
1.551117, 0.1980204, 3.181741, 1, 1, 1, 1, 1,
1.563007, 1.530739, 1.455662, 1, 1, 1, 1, 1,
1.570877, -0.8948334, 2.541236, 0, 0, 1, 1, 1,
1.576771, -0.48563, 0.9847919, 1, 0, 0, 1, 1,
1.58111, -1.208442, 2.277766, 1, 0, 0, 1, 1,
1.583579, -0.8507246, 1.247228, 1, 0, 0, 1, 1,
1.587658, 0.3820654, 1.014044, 1, 0, 0, 1, 1,
1.607595, -1.588336, 4.257984, 1, 0, 0, 1, 1,
1.615457, 0.2056031, 0.7474254, 0, 0, 0, 1, 1,
1.625301, 0.3112784, 1.821267, 0, 0, 0, 1, 1,
1.627335, 0.1827654, 0.6466723, 0, 0, 0, 1, 1,
1.64311, 1.018048, 1.57434, 0, 0, 0, 1, 1,
1.674862, 1.469968, 0.8848119, 0, 0, 0, 1, 1,
1.691773, 0.7218105, -0.2393478, 0, 0, 0, 1, 1,
1.697888, -0.8582728, 1.70473, 0, 0, 0, 1, 1,
1.704727, -0.02370937, 1.916036, 1, 1, 1, 1, 1,
1.714019, 0.4370417, 2.440639, 1, 1, 1, 1, 1,
1.734209, -1.456749, 3.421759, 1, 1, 1, 1, 1,
1.736236, -0.2997178, 3.655021, 1, 1, 1, 1, 1,
1.741157, 1.489274, 2.13483, 1, 1, 1, 1, 1,
1.811184, -1.033699, 2.932281, 1, 1, 1, 1, 1,
1.823452, -0.09043958, 2.858653, 1, 1, 1, 1, 1,
1.835162, -0.1544689, 0.2574704, 1, 1, 1, 1, 1,
1.842586, 0.5260264, 2.23129, 1, 1, 1, 1, 1,
1.858522, 1.272369, 0.4840785, 1, 1, 1, 1, 1,
1.89491, 0.3548378, 1.41554, 1, 1, 1, 1, 1,
1.912514, 0.8310447, 3.463245, 1, 1, 1, 1, 1,
1.938859, 0.3762252, -0.3138084, 1, 1, 1, 1, 1,
1.940827, -0.479952, 1.856275, 1, 1, 1, 1, 1,
1.963462, -0.07611036, 3.26579, 1, 1, 1, 1, 1,
2.003726, -1.66639, 2.285918, 0, 0, 1, 1, 1,
2.00578, 1.161487, 0.9252343, 1, 0, 0, 1, 1,
2.00648, -0.9711383, 2.63158, 1, 0, 0, 1, 1,
2.010494, 0.1510838, 2.962494, 1, 0, 0, 1, 1,
2.018582, -0.02290722, 0.5061089, 1, 0, 0, 1, 1,
2.051543, -0.5642414, 0.6313456, 1, 0, 0, 1, 1,
2.069429, 0.4622228, 0.009709475, 0, 0, 0, 1, 1,
2.074244, 1.507631, 0.7973598, 0, 0, 0, 1, 1,
2.097598, -0.6512316, 0.5784764, 0, 0, 0, 1, 1,
2.140935, 0.7568917, 1.959895, 0, 0, 0, 1, 1,
2.162573, -0.4143444, 0.2763323, 0, 0, 0, 1, 1,
2.199007, -0.3209005, 2.845621, 0, 0, 0, 1, 1,
2.210738, 0.1715217, 2.638892, 0, 0, 0, 1, 1,
2.314217, 0.9043228, 0.1125251, 1, 1, 1, 1, 1,
2.322633, 0.2848918, 0.7984475, 1, 1, 1, 1, 1,
2.327447, -0.7832203, 2.219476, 1, 1, 1, 1, 1,
2.329382, -0.7757313, 1.757979, 1, 1, 1, 1, 1,
2.433305, -1.136383, -0.2044659, 1, 1, 1, 1, 1,
2.478172, -0.8617895, 2.121219, 1, 1, 1, 1, 1,
2.761745, 1.587597, -0.4926113, 1, 1, 1, 1, 1
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
var radius = 9.206554;
var distance = 32.33763;
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
mvMatrix.translate( 0.3138549, -0.02904701, 0.06173635 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.33763);
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
