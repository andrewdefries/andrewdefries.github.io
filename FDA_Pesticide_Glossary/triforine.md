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
-3.412377, -0.2805056, -3.456054, 1, 0, 0, 1,
-3.195342, 0.955283, -1.06349, 1, 0.007843138, 0, 1,
-2.912015, 0.7736448, -1.49852, 1, 0.01176471, 0, 1,
-2.887783, -0.1136013, -0.1024629, 1, 0.01960784, 0, 1,
-2.849442, 0.2411053, -2.205831, 1, 0.02352941, 0, 1,
-2.622429, -1.440595, -1.593909, 1, 0.03137255, 0, 1,
-2.577265, -1.820006, -2.152378, 1, 0.03529412, 0, 1,
-2.5747, -0.5758903, -2.384724, 1, 0.04313726, 0, 1,
-2.565106, -0.07511562, 1.572282, 1, 0.04705882, 0, 1,
-2.372355, -1.086721, -2.739374, 1, 0.05490196, 0, 1,
-2.364817, 0.1162338, -1.002223, 1, 0.05882353, 0, 1,
-2.347724, -1.215271, -3.520537, 1, 0.06666667, 0, 1,
-2.327941, -0.3762227, -2.338316, 1, 0.07058824, 0, 1,
-2.261605, 1.234481, -1.773988, 1, 0.07843138, 0, 1,
-2.17934, -0.6766407, -0.9605286, 1, 0.08235294, 0, 1,
-2.140899, -1.810755, -3.436938, 1, 0.09019608, 0, 1,
-2.110664, -0.6012791, -3.993642, 1, 0.09411765, 0, 1,
-2.097193, -0.3920326, -0.9042285, 1, 0.1019608, 0, 1,
-2.085865, -0.07934929, -2.442626, 1, 0.1098039, 0, 1,
-2.067457, 0.7915978, -1.364733, 1, 0.1137255, 0, 1,
-2.0458, -2.055318, -3.363802, 1, 0.1215686, 0, 1,
-2.044789, -0.481019, -0.7910026, 1, 0.1254902, 0, 1,
-2.044404, -0.2442319, -2.312913, 1, 0.1333333, 0, 1,
-2.041506, 0.1960724, -0.1132826, 1, 0.1372549, 0, 1,
-2.034033, 0.320348, -1.491208, 1, 0.145098, 0, 1,
-2.027367, 1.004855, -0.5941194, 1, 0.1490196, 0, 1,
-2.024281, 1.242448, -1.622435, 1, 0.1568628, 0, 1,
-2.022977, 0.1099921, 0.06782997, 1, 0.1607843, 0, 1,
-2.011881, 1.27679, -1.200938, 1, 0.1686275, 0, 1,
-2.0111, -0.1493551, -1.723472, 1, 0.172549, 0, 1,
-2.000706, 0.5639761, -1.374877, 1, 0.1803922, 0, 1,
-1.985591, 1.398601, -0.5091828, 1, 0.1843137, 0, 1,
-1.937964, -0.6735882, -0.2503838, 1, 0.1921569, 0, 1,
-1.905204, -0.5390735, -2.479182, 1, 0.1960784, 0, 1,
-1.893334, 0.1566479, -3.941034, 1, 0.2039216, 0, 1,
-1.882838, 0.9624372, -1.940464, 1, 0.2117647, 0, 1,
-1.880764, -0.2608095, -0.8531, 1, 0.2156863, 0, 1,
-1.877586, 0.5855005, -2.045879, 1, 0.2235294, 0, 1,
-1.872913, 0.1025143, -1.691136, 1, 0.227451, 0, 1,
-1.866836, 1.017941, 0.1557432, 1, 0.2352941, 0, 1,
-1.852668, -0.3280408, -1.315405, 1, 0.2392157, 0, 1,
-1.833862, -1.385487, -2.541238, 1, 0.2470588, 0, 1,
-1.806269, -1.442217, -3.058521, 1, 0.2509804, 0, 1,
-1.781628, -0.07526251, -1.770226, 1, 0.2588235, 0, 1,
-1.775816, -1.812167, -2.781353, 1, 0.2627451, 0, 1,
-1.774166, 1.805046, -0.8653353, 1, 0.2705882, 0, 1,
-1.773153, 0.7471259, -1.853105, 1, 0.2745098, 0, 1,
-1.758744, -0.5364169, -0.8912618, 1, 0.282353, 0, 1,
-1.75326, -1.400311, -1.47398, 1, 0.2862745, 0, 1,
-1.746086, 0.1847803, -2.797328, 1, 0.2941177, 0, 1,
-1.745437, 0.2720052, -1.467493, 1, 0.3019608, 0, 1,
-1.739299, 0.4153346, -1.289837, 1, 0.3058824, 0, 1,
-1.717499, 0.7722222, 0.06444338, 1, 0.3137255, 0, 1,
-1.702482, 0.8260433, -1.396557, 1, 0.3176471, 0, 1,
-1.69969, 2.538513, -1.750322, 1, 0.3254902, 0, 1,
-1.696516, -0.09803607, -3.126227, 1, 0.3294118, 0, 1,
-1.691051, -0.6739557, -3.322675, 1, 0.3372549, 0, 1,
-1.689288, -1.345309, -2.794437, 1, 0.3411765, 0, 1,
-1.686278, 0.6557525, 0.1296398, 1, 0.3490196, 0, 1,
-1.685665, -0.3025209, -1.434227, 1, 0.3529412, 0, 1,
-1.678918, -1.491302, -3.186853, 1, 0.3607843, 0, 1,
-1.662576, -1.625999, -2.442796, 1, 0.3647059, 0, 1,
-1.66178, 0.1512374, -0.5936707, 1, 0.372549, 0, 1,
-1.65196, 1.565829, -0.6630498, 1, 0.3764706, 0, 1,
-1.646735, -0.4764546, -4.203253, 1, 0.3843137, 0, 1,
-1.636147, -1.263637, -1.42626, 1, 0.3882353, 0, 1,
-1.634426, -0.8272042, -4.056432, 1, 0.3960784, 0, 1,
-1.600094, 0.7430803, -2.245941, 1, 0.4039216, 0, 1,
-1.59631, -1.222675, -2.84697, 1, 0.4078431, 0, 1,
-1.572093, -0.8313883, -1.569407, 1, 0.4156863, 0, 1,
-1.568953, 0.7403136, -0.02447941, 1, 0.4196078, 0, 1,
-1.564794, -0.6308264, -1.811592, 1, 0.427451, 0, 1,
-1.564242, -0.6282731, -1.977971, 1, 0.4313726, 0, 1,
-1.557964, 1.107462, -1.532164, 1, 0.4392157, 0, 1,
-1.55062, 0.9251388, 0.4201154, 1, 0.4431373, 0, 1,
-1.550022, -0.6605483, -0.5712652, 1, 0.4509804, 0, 1,
-1.539353, 0.7889544, -0.8016122, 1, 0.454902, 0, 1,
-1.533099, 0.3763843, -1.832765, 1, 0.4627451, 0, 1,
-1.528198, -0.9921171, -2.817493, 1, 0.4666667, 0, 1,
-1.506157, -1.914852, -3.483595, 1, 0.4745098, 0, 1,
-1.489518, 0.02388872, -0.3621705, 1, 0.4784314, 0, 1,
-1.473821, 0.6583776, -1.549198, 1, 0.4862745, 0, 1,
-1.457011, -0.2522317, -1.482344, 1, 0.4901961, 0, 1,
-1.445522, 0.8568914, -2.197556, 1, 0.4980392, 0, 1,
-1.443491, 0.3583447, -1.691363, 1, 0.5058824, 0, 1,
-1.443029, -1.574745, -1.689584, 1, 0.509804, 0, 1,
-1.440592, -0.3715579, -1.617705, 1, 0.5176471, 0, 1,
-1.439132, 1.930999, -0.843184, 1, 0.5215687, 0, 1,
-1.437767, -1.045121, -1.617351, 1, 0.5294118, 0, 1,
-1.435437, -0.641368, -3.14594, 1, 0.5333334, 0, 1,
-1.427227, -0.1303592, -1.595798, 1, 0.5411765, 0, 1,
-1.424034, 0.2855954, 0.03978888, 1, 0.5450981, 0, 1,
-1.420598, -0.3256818, -1.675243, 1, 0.5529412, 0, 1,
-1.41036, -0.5682953, -2.284565, 1, 0.5568628, 0, 1,
-1.399722, -0.6108549, -2.739801, 1, 0.5647059, 0, 1,
-1.395902, 0.2359625, -2.519754, 1, 0.5686275, 0, 1,
-1.377862, 1.409907, -0.9248539, 1, 0.5764706, 0, 1,
-1.371358, 0.3271554, -1.104123, 1, 0.5803922, 0, 1,
-1.364552, 0.9413301, -0.6113555, 1, 0.5882353, 0, 1,
-1.363726, 0.3498486, 0.2261533, 1, 0.5921569, 0, 1,
-1.358654, 0.6381533, -0.8515511, 1, 0.6, 0, 1,
-1.344537, 0.2704372, -0.1093933, 1, 0.6078432, 0, 1,
-1.341466, -0.1602782, -1.862601, 1, 0.6117647, 0, 1,
-1.333084, 1.670777, 0.2381588, 1, 0.6196079, 0, 1,
-1.331244, 0.8712727, -2.350811, 1, 0.6235294, 0, 1,
-1.322221, -0.0281797, -0.8905341, 1, 0.6313726, 0, 1,
-1.313336, -0.006088068, -1.456864, 1, 0.6352941, 0, 1,
-1.313175, 0.3212623, -2.025068, 1, 0.6431373, 0, 1,
-1.305039, -1.01811, -2.838603, 1, 0.6470588, 0, 1,
-1.301347, -0.8199214, -0.6941221, 1, 0.654902, 0, 1,
-1.298105, 1.525779, -2.076198, 1, 0.6588235, 0, 1,
-1.29419, 1.101889, -0.6430468, 1, 0.6666667, 0, 1,
-1.292616, 0.7638962, -1.18738, 1, 0.6705883, 0, 1,
-1.284432, 0.982272, -1.616391, 1, 0.6784314, 0, 1,
-1.282637, 0.6177098, -0.2606964, 1, 0.682353, 0, 1,
-1.274358, 0.2863264, -0.07978667, 1, 0.6901961, 0, 1,
-1.270035, 1.420742, -2.355308, 1, 0.6941177, 0, 1,
-1.265748, -0.5491179, -3.527565, 1, 0.7019608, 0, 1,
-1.265169, -1.228634, -2.199697, 1, 0.7098039, 0, 1,
-1.264798, 2.291513, 1.005627, 1, 0.7137255, 0, 1,
-1.258562, -0.3475322, -2.664612, 1, 0.7215686, 0, 1,
-1.249124, -1.898727, -3.763149, 1, 0.7254902, 0, 1,
-1.247699, -1.243904, -2.951614, 1, 0.7333333, 0, 1,
-1.238743, 1.429941, -2.325624, 1, 0.7372549, 0, 1,
-1.237175, 1.850474, -0.3091572, 1, 0.7450981, 0, 1,
-1.235022, 1.266012, -0.3710856, 1, 0.7490196, 0, 1,
-1.23297, 0.440701, -0.3327664, 1, 0.7568628, 0, 1,
-1.223507, -0.3741691, -2.034931, 1, 0.7607843, 0, 1,
-1.213563, -1.105343, -1.932577, 1, 0.7686275, 0, 1,
-1.20903, -0.6997128, -2.141197, 1, 0.772549, 0, 1,
-1.196309, -0.8062153, -0.6665531, 1, 0.7803922, 0, 1,
-1.191925, 0.9307318, -1.81623, 1, 0.7843137, 0, 1,
-1.191689, 0.08994325, -1.359882, 1, 0.7921569, 0, 1,
-1.190937, -0.3045081, -1.836146, 1, 0.7960784, 0, 1,
-1.187963, 0.6097261, -1.023202, 1, 0.8039216, 0, 1,
-1.183751, -0.4524866, -1.786391, 1, 0.8117647, 0, 1,
-1.180197, 0.6675472, -0.6185195, 1, 0.8156863, 0, 1,
-1.180039, 0.5747417, -1.029792, 1, 0.8235294, 0, 1,
-1.175452, -1.324014, -3.938603, 1, 0.827451, 0, 1,
-1.17181, 0.1138274, -1.599327, 1, 0.8352941, 0, 1,
-1.164458, -1.075447, -1.960512, 1, 0.8392157, 0, 1,
-1.160339, -1.783274, -4.480215, 1, 0.8470588, 0, 1,
-1.158926, 0.04614026, -1.62012, 1, 0.8509804, 0, 1,
-1.157995, -0.1386697, -2.585715, 1, 0.8588235, 0, 1,
-1.156685, 0.9187161, -2.684354, 1, 0.8627451, 0, 1,
-1.154606, -1.127914, -0.9452768, 1, 0.8705882, 0, 1,
-1.152781, 0.6760866, -3.400047, 1, 0.8745098, 0, 1,
-1.152189, 0.3175791, 0.4047125, 1, 0.8823529, 0, 1,
-1.143264, -1.227751, -3.725869, 1, 0.8862745, 0, 1,
-1.140683, 0.2848993, 0.4588661, 1, 0.8941177, 0, 1,
-1.139868, 0.9047321, -2.056229, 1, 0.8980392, 0, 1,
-1.130116, -0.1292518, -3.416658, 1, 0.9058824, 0, 1,
-1.129342, 0.9838691, -0.8738732, 1, 0.9137255, 0, 1,
-1.126087, 1.052515, 0.03651538, 1, 0.9176471, 0, 1,
-1.12527, -0.7861921, -2.267722, 1, 0.9254902, 0, 1,
-1.121285, 0.9235917, 0.3500245, 1, 0.9294118, 0, 1,
-1.114527, 1.611181, -1.887028, 1, 0.9372549, 0, 1,
-1.101562, 0.3621981, 0.3664815, 1, 0.9411765, 0, 1,
-1.089478, -0.585808, -3.042847, 1, 0.9490196, 0, 1,
-1.081315, 0.1773129, -1.486356, 1, 0.9529412, 0, 1,
-1.076374, -0.5623411, -2.181462, 1, 0.9607843, 0, 1,
-1.074025, 0.9511511, 0.0600979, 1, 0.9647059, 0, 1,
-1.073701, -0.7290759, -1.903831, 1, 0.972549, 0, 1,
-1.073616, 0.7199808, -1.771527, 1, 0.9764706, 0, 1,
-1.071531, -0.6219549, -1.992106, 1, 0.9843137, 0, 1,
-1.064932, 0.4780355, 0.1528397, 1, 0.9882353, 0, 1,
-1.063962, 0.5167975, -1.390557, 1, 0.9960784, 0, 1,
-1.063823, -0.5004228, -3.13493, 0.9960784, 1, 0, 1,
-1.049757, 1.851276, -0.8128643, 0.9921569, 1, 0, 1,
-1.048272, -1.214842, -2.437356, 0.9843137, 1, 0, 1,
-1.046008, 1.304311, -0.2606796, 0.9803922, 1, 0, 1,
-1.045933, -1.223252, -3.729698, 0.972549, 1, 0, 1,
-1.037224, 0.655505, -1.957062, 0.9686275, 1, 0, 1,
-1.036718, -1.018493, -1.179607, 0.9607843, 1, 0, 1,
-1.033225, 0.03064498, -1.359204, 0.9568627, 1, 0, 1,
-1.029348, -1.412577, -3.408847, 0.9490196, 1, 0, 1,
-1.024017, 0.2903118, -1.413208, 0.945098, 1, 0, 1,
-1.01862, -0.7396512, -1.243585, 0.9372549, 1, 0, 1,
-1.016395, -1.857667, -1.003651, 0.9333333, 1, 0, 1,
-1.015936, -0.6996846, -2.837988, 0.9254902, 1, 0, 1,
-1.012645, -1.224794, -0.7156205, 0.9215686, 1, 0, 1,
-1.011996, 0.6353291, -2.004063, 0.9137255, 1, 0, 1,
-1.007863, 0.03699568, -2.674873, 0.9098039, 1, 0, 1,
-1.001837, 1.909785, -1.206596, 0.9019608, 1, 0, 1,
-0.9927616, 0.6932474, -0.9094155, 0.8941177, 1, 0, 1,
-0.9876924, -0.2567742, -1.100834, 0.8901961, 1, 0, 1,
-0.9840442, 0.1646719, -3.140759, 0.8823529, 1, 0, 1,
-0.9740544, -0.2203625, -2.172776, 0.8784314, 1, 0, 1,
-0.9709716, -0.2618804, -1.288433, 0.8705882, 1, 0, 1,
-0.9667042, -0.3473382, -1.854372, 0.8666667, 1, 0, 1,
-0.9605052, -1.641535, -2.662917, 0.8588235, 1, 0, 1,
-0.9592021, -0.216429, -3.243781, 0.854902, 1, 0, 1,
-0.9586913, 0.1271093, -0.5465394, 0.8470588, 1, 0, 1,
-0.950987, 1.664484, -0.02819759, 0.8431373, 1, 0, 1,
-0.9448301, 0.1697309, -0.9031068, 0.8352941, 1, 0, 1,
-0.9407095, -0.1803838, -2.005131, 0.8313726, 1, 0, 1,
-0.9391384, 0.1743769, -0.3111544, 0.8235294, 1, 0, 1,
-0.9364632, -0.5991889, -4.670565, 0.8196079, 1, 0, 1,
-0.9354916, 0.9039686, -0.7921642, 0.8117647, 1, 0, 1,
-0.9215593, 0.2500169, -1.018476, 0.8078431, 1, 0, 1,
-0.9175979, 1.512663, -2.591328, 0.8, 1, 0, 1,
-0.9167877, -1.055684, -2.201087, 0.7921569, 1, 0, 1,
-0.9167076, -1.037608, -1.837046, 0.7882353, 1, 0, 1,
-0.913231, 1.317321, -1.450457, 0.7803922, 1, 0, 1,
-0.9101538, 0.1503288, -0.2680479, 0.7764706, 1, 0, 1,
-0.9092495, 1.561526, -0.2802426, 0.7686275, 1, 0, 1,
-0.9073588, -0.5193372, -1.240909, 0.7647059, 1, 0, 1,
-0.9040385, 0.002188364, -2.955674, 0.7568628, 1, 0, 1,
-0.8978969, -0.1221676, -1.202305, 0.7529412, 1, 0, 1,
-0.8943775, 0.0338339, -2.645793, 0.7450981, 1, 0, 1,
-0.8926541, 1.070994, -1.028553, 0.7411765, 1, 0, 1,
-0.8885497, -0.7385599, -3.090285, 0.7333333, 1, 0, 1,
-0.8858902, -0.7708682, -1.113558, 0.7294118, 1, 0, 1,
-0.8852421, -0.03667816, -0.8049711, 0.7215686, 1, 0, 1,
-0.8789067, 2.36966, -1.089225, 0.7176471, 1, 0, 1,
-0.8784347, 1.174716, -0.2178576, 0.7098039, 1, 0, 1,
-0.8784206, 0.3268572, -2.154347, 0.7058824, 1, 0, 1,
-0.8703087, 0.1547822, -1.813174, 0.6980392, 1, 0, 1,
-0.8662868, 2.382084, 0.0611058, 0.6901961, 1, 0, 1,
-0.8604531, 0.355623, -0.482036, 0.6862745, 1, 0, 1,
-0.8591817, 1.818165, -0.08233805, 0.6784314, 1, 0, 1,
-0.857556, 0.2858007, -3.279013, 0.6745098, 1, 0, 1,
-0.8552267, 2.369169, -0.9827917, 0.6666667, 1, 0, 1,
-0.8535468, -0.05714736, -0.7882352, 0.6627451, 1, 0, 1,
-0.8533325, 1.355323, -1.370975, 0.654902, 1, 0, 1,
-0.8487092, -0.3590534, -2.775132, 0.6509804, 1, 0, 1,
-0.8372374, -0.3586612, -1.0288, 0.6431373, 1, 0, 1,
-0.8320206, 0.5652768, -1.954543, 0.6392157, 1, 0, 1,
-0.8279604, -0.1501453, -2.166078, 0.6313726, 1, 0, 1,
-0.8277765, -2.192338, -4.136751, 0.627451, 1, 0, 1,
-0.8276891, 0.04189949, -1.616022, 0.6196079, 1, 0, 1,
-0.8263932, -0.249992, -1.552141, 0.6156863, 1, 0, 1,
-0.8217453, 1.234818, -0.5715166, 0.6078432, 1, 0, 1,
-0.8186657, 0.1212111, -3.693078, 0.6039216, 1, 0, 1,
-0.8092523, 0.9839433, -2.331683, 0.5960785, 1, 0, 1,
-0.8077969, -0.5570184, -1.000745, 0.5882353, 1, 0, 1,
-0.8013726, -0.2274789, -1.242743, 0.5843138, 1, 0, 1,
-0.7941067, -1.545763, -3.570296, 0.5764706, 1, 0, 1,
-0.7872549, 1.252551, -1.13817, 0.572549, 1, 0, 1,
-0.7857471, -0.7496616, -4.036396, 0.5647059, 1, 0, 1,
-0.7851909, -0.806847, -4.116757, 0.5607843, 1, 0, 1,
-0.7822134, -2.167647, -1.857263, 0.5529412, 1, 0, 1,
-0.7688826, -1.953955, 0.3818435, 0.5490196, 1, 0, 1,
-0.7667263, -1.761219, -3.090838, 0.5411765, 1, 0, 1,
-0.7603125, 0.1417134, -2.176502, 0.5372549, 1, 0, 1,
-0.7539002, 0.0881198, -1.607133, 0.5294118, 1, 0, 1,
-0.7444786, 0.08672761, -2.196756, 0.5254902, 1, 0, 1,
-0.7436019, 1.159162, 1.484969, 0.5176471, 1, 0, 1,
-0.7421435, -1.039634, -2.299216, 0.5137255, 1, 0, 1,
-0.7419631, 2.413085, -0.1125296, 0.5058824, 1, 0, 1,
-0.7406825, -0.2705293, -2.263235, 0.5019608, 1, 0, 1,
-0.7394203, -1.514808, -2.606786, 0.4941176, 1, 0, 1,
-0.7393615, 0.4323667, -0.4623004, 0.4862745, 1, 0, 1,
-0.7365285, 0.5284037, 0.9356514, 0.4823529, 1, 0, 1,
-0.7269822, 1.018358, -0.2994657, 0.4745098, 1, 0, 1,
-0.7230383, -0.9805697, -2.746464, 0.4705882, 1, 0, 1,
-0.719417, -0.04005063, -0.06009591, 0.4627451, 1, 0, 1,
-0.713375, 1.765172, -1.19037, 0.4588235, 1, 0, 1,
-0.7122778, -1.480975, -3.678309, 0.4509804, 1, 0, 1,
-0.7101183, -0.07135458, -3.240916, 0.4470588, 1, 0, 1,
-0.7090045, -0.3315863, -2.842739, 0.4392157, 1, 0, 1,
-0.7063198, -0.5786992, -1.69074, 0.4352941, 1, 0, 1,
-0.7061283, 1.443625, -1.518982, 0.427451, 1, 0, 1,
-0.7049965, -1.616119, -2.17585, 0.4235294, 1, 0, 1,
-0.7013172, -1.06916, -1.609166, 0.4156863, 1, 0, 1,
-0.6977963, 0.3521357, -2.088241, 0.4117647, 1, 0, 1,
-0.6953945, 1.532766, -1.655244, 0.4039216, 1, 0, 1,
-0.6933996, 0.7909506, 0.7553424, 0.3960784, 1, 0, 1,
-0.6928999, 0.170013, -3.050407, 0.3921569, 1, 0, 1,
-0.6927741, -0.1963353, -0.3427272, 0.3843137, 1, 0, 1,
-0.6893355, 0.03437402, -2.623356, 0.3803922, 1, 0, 1,
-0.6887081, -0.1874116, -2.233021, 0.372549, 1, 0, 1,
-0.6863706, -0.2100509, 0.06038, 0.3686275, 1, 0, 1,
-0.6857097, 0.9532951, -0.01659918, 0.3607843, 1, 0, 1,
-0.6797312, 0.7905343, -1.105837, 0.3568628, 1, 0, 1,
-0.6770836, -2.21251, -2.495217, 0.3490196, 1, 0, 1,
-0.6712828, -0.2976319, -2.471872, 0.345098, 1, 0, 1,
-0.6695197, 0.6618677, -2.245357, 0.3372549, 1, 0, 1,
-0.6673676, -0.161846, -0.9663025, 0.3333333, 1, 0, 1,
-0.6648855, 1.512323, -0.01094613, 0.3254902, 1, 0, 1,
-0.6645355, -0.4654602, -3.971453, 0.3215686, 1, 0, 1,
-0.6642064, 0.1516587, -2.315336, 0.3137255, 1, 0, 1,
-0.6616567, 1.341367, 0.6539504, 0.3098039, 1, 0, 1,
-0.6594386, 0.5693793, -0.6503325, 0.3019608, 1, 0, 1,
-0.646177, 0.08905512, -1.546577, 0.2941177, 1, 0, 1,
-0.6429437, -1.452026, -3.0581, 0.2901961, 1, 0, 1,
-0.6425226, 1.132647, 0.6993213, 0.282353, 1, 0, 1,
-0.6382915, 0.1406207, -0.6409968, 0.2784314, 1, 0, 1,
-0.6372364, 1.424632, -1.39791, 0.2705882, 1, 0, 1,
-0.6326011, -0.7397133, -1.264876, 0.2666667, 1, 0, 1,
-0.631405, -0.1724451, -0.8793728, 0.2588235, 1, 0, 1,
-0.627357, -0.09257057, -2.274826, 0.254902, 1, 0, 1,
-0.6271296, 0.535668, -0.4939519, 0.2470588, 1, 0, 1,
-0.6271248, 0.5528307, -0.7029691, 0.2431373, 1, 0, 1,
-0.6266606, -2.663677, -3.305834, 0.2352941, 1, 0, 1,
-0.6264989, 0.318812, -2.295047, 0.2313726, 1, 0, 1,
-0.6186068, 0.3700416, -0.07709116, 0.2235294, 1, 0, 1,
-0.6160083, -0.24932, -0.7695309, 0.2196078, 1, 0, 1,
-0.6145248, 1.14, -1.148223, 0.2117647, 1, 0, 1,
-0.6140764, 0.6721758, -1.309289, 0.2078431, 1, 0, 1,
-0.613646, 0.3590486, -3.155614, 0.2, 1, 0, 1,
-0.6116815, 0.5182596, -0.1872074, 0.1921569, 1, 0, 1,
-0.6065431, 0.1521961, -1.687843, 0.1882353, 1, 0, 1,
-0.5928456, -0.1827907, -0.4059324, 0.1803922, 1, 0, 1,
-0.59248, 0.1960277, -2.258972, 0.1764706, 1, 0, 1,
-0.5825425, -0.1830397, -0.4297092, 0.1686275, 1, 0, 1,
-0.5757697, 2.141212, -0.1167159, 0.1647059, 1, 0, 1,
-0.5731412, 0.7562603, -2.399984, 0.1568628, 1, 0, 1,
-0.5632289, 0.1353541, -1.641141, 0.1529412, 1, 0, 1,
-0.5525615, -0.05626112, -1.889512, 0.145098, 1, 0, 1,
-0.5508065, 0.01967363, -1.106826, 0.1411765, 1, 0, 1,
-0.5503612, -1.564089, -2.698439, 0.1333333, 1, 0, 1,
-0.5497399, -0.9727463, -2.101604, 0.1294118, 1, 0, 1,
-0.5463974, 1.560074, 0.7557495, 0.1215686, 1, 0, 1,
-0.5460979, 0.2402529, -1.806789, 0.1176471, 1, 0, 1,
-0.5447794, 1.61376, -0.3935349, 0.1098039, 1, 0, 1,
-0.5427681, -1.362527, -3.888075, 0.1058824, 1, 0, 1,
-0.5256466, -1.482864, -3.042539, 0.09803922, 1, 0, 1,
-0.5202129, 0.3936322, -1.836636, 0.09019608, 1, 0, 1,
-0.5151269, 0.8654999, -1.445524, 0.08627451, 1, 0, 1,
-0.5138124, -1.03551, -3.581873, 0.07843138, 1, 0, 1,
-0.5118137, 0.4818427, 0.2674805, 0.07450981, 1, 0, 1,
-0.5038713, 0.6341809, -0.8229975, 0.06666667, 1, 0, 1,
-0.4953966, -1.348815, -4.275127, 0.0627451, 1, 0, 1,
-0.4948778, 1.696352, -0.4902989, 0.05490196, 1, 0, 1,
-0.4916256, -1.098947, -2.849961, 0.05098039, 1, 0, 1,
-0.4888403, 0.1664752, -1.885783, 0.04313726, 1, 0, 1,
-0.4855287, -0.7366641, -4.413715, 0.03921569, 1, 0, 1,
-0.4787543, 0.03943599, -1.308178, 0.03137255, 1, 0, 1,
-0.4745308, -0.1375077, -0.3328626, 0.02745098, 1, 0, 1,
-0.4723638, -0.7043931, -1.774892, 0.01960784, 1, 0, 1,
-0.4721934, 0.5216799, -1.161986, 0.01568628, 1, 0, 1,
-0.469117, -0.09551472, -2.181997, 0.007843138, 1, 0, 1,
-0.4687231, 1.429656, 0.2051561, 0.003921569, 1, 0, 1,
-0.4679622, -0.9967908, -1.401394, 0, 1, 0.003921569, 1,
-0.4627298, -0.2613226, -1.459584, 0, 1, 0.01176471, 1,
-0.4598124, 0.2802657, 0.1790399, 0, 1, 0.01568628, 1,
-0.4591776, -1.22625, -3.259399, 0, 1, 0.02352941, 1,
-0.4564101, -2.973931, -3.960677, 0, 1, 0.02745098, 1,
-0.4542808, 0.9968481, 0.1339798, 0, 1, 0.03529412, 1,
-0.4527999, 0.1841701, -0.7648956, 0, 1, 0.03921569, 1,
-0.4516398, -0.7449344, -2.093304, 0, 1, 0.04705882, 1,
-0.4501401, 1.098174, -1.025917, 0, 1, 0.05098039, 1,
-0.4467257, -0.7552792, -1.066778, 0, 1, 0.05882353, 1,
-0.4413846, -0.7743713, -1.442441, 0, 1, 0.0627451, 1,
-0.437514, 0.3060576, -0.4954999, 0, 1, 0.07058824, 1,
-0.4309084, -0.4509513, -2.89729, 0, 1, 0.07450981, 1,
-0.4270896, 0.2188815, -0.6586646, 0, 1, 0.08235294, 1,
-0.4267748, 0.4385975, 0.7846405, 0, 1, 0.08627451, 1,
-0.421747, -1.491125, -3.554986, 0, 1, 0.09411765, 1,
-0.4196598, 0.06855203, -1.192861, 0, 1, 0.1019608, 1,
-0.4173243, 1.688715, 1.507784, 0, 1, 0.1058824, 1,
-0.4162458, 0.1601695, -2.908237, 0, 1, 0.1137255, 1,
-0.4145336, 0.07551774, -1.554757, 0, 1, 0.1176471, 1,
-0.4118468, -1.005277, -2.97814, 0, 1, 0.1254902, 1,
-0.4109013, -1.488615, -3.876149, 0, 1, 0.1294118, 1,
-0.4108202, -1.30801, -2.002791, 0, 1, 0.1372549, 1,
-0.4098465, 0.005870445, 0.4279269, 0, 1, 0.1411765, 1,
-0.4078233, 0.9379114, 1.329046, 0, 1, 0.1490196, 1,
-0.403602, -0.5156677, -3.204986, 0, 1, 0.1529412, 1,
-0.4004818, -1.206168, -1.711683, 0, 1, 0.1607843, 1,
-0.3961746, 0.182806, -0.09436096, 0, 1, 0.1647059, 1,
-0.3956132, -1.443646, -2.951651, 0, 1, 0.172549, 1,
-0.3920113, 1.197943, -1.270046, 0, 1, 0.1764706, 1,
-0.3890863, -1.360294, -3.940994, 0, 1, 0.1843137, 1,
-0.3846763, 1.487543, -0.5711445, 0, 1, 0.1882353, 1,
-0.3836075, 1.663346, 0.2188187, 0, 1, 0.1960784, 1,
-0.381619, 0.1360587, -0.4048848, 0, 1, 0.2039216, 1,
-0.3790819, -0.1075376, -1.641286, 0, 1, 0.2078431, 1,
-0.3787889, -0.4093929, -2.342599, 0, 1, 0.2156863, 1,
-0.3730685, 1.076374, -0.0974121, 0, 1, 0.2196078, 1,
-0.3712946, 0.09942026, -0.9745502, 0, 1, 0.227451, 1,
-0.3701348, 0.5928486, 0.1043479, 0, 1, 0.2313726, 1,
-0.366945, -0.4362408, -3.874336, 0, 1, 0.2392157, 1,
-0.3662921, -0.1260932, -0.7360484, 0, 1, 0.2431373, 1,
-0.3661472, 0.6627799, 0.07840735, 0, 1, 0.2509804, 1,
-0.3661427, -0.8944643, -3.599022, 0, 1, 0.254902, 1,
-0.3613288, -1.604245, -3.896403, 0, 1, 0.2627451, 1,
-0.3593961, 1.323741, 0.6170775, 0, 1, 0.2666667, 1,
-0.3584449, -0.3833958, -1.586891, 0, 1, 0.2745098, 1,
-0.353568, -2.447604, -3.614032, 0, 1, 0.2784314, 1,
-0.3525039, 0.8459337, 1.169785, 0, 1, 0.2862745, 1,
-0.3514553, 0.01044929, 0.03764481, 0, 1, 0.2901961, 1,
-0.3505573, 0.7453599, -0.7578053, 0, 1, 0.2980392, 1,
-0.3504549, 1.1324, -0.5757133, 0, 1, 0.3058824, 1,
-0.3503308, -0.2548853, -2.022335, 0, 1, 0.3098039, 1,
-0.3481045, 0.7234496, -0.4854673, 0, 1, 0.3176471, 1,
-0.3480537, 0.07950557, -3.031275, 0, 1, 0.3215686, 1,
-0.3479229, -0.7940917, -2.955201, 0, 1, 0.3294118, 1,
-0.3398932, 0.03994746, -0.7440602, 0, 1, 0.3333333, 1,
-0.3337529, 1.876597, -0.6358531, 0, 1, 0.3411765, 1,
-0.3302739, 1.141359, 1.128505, 0, 1, 0.345098, 1,
-0.3301398, -1.193625, -1.691169, 0, 1, 0.3529412, 1,
-0.3295333, 0.5671857, -0.7386214, 0, 1, 0.3568628, 1,
-0.3285737, -0.817789, -1.121346, 0, 1, 0.3647059, 1,
-0.3276685, 0.8183233, -2.138531, 0, 1, 0.3686275, 1,
-0.3254149, -0.686665, -1.616882, 0, 1, 0.3764706, 1,
-0.3246541, -0.8936152, -5.527972, 0, 1, 0.3803922, 1,
-0.322868, -0.8298156, -3.410978, 0, 1, 0.3882353, 1,
-0.3214425, 0.1559503, -0.3619135, 0, 1, 0.3921569, 1,
-0.3181069, -1.236975, -0.3702357, 0, 1, 0.4, 1,
-0.3142782, 0.6346052, -0.9420403, 0, 1, 0.4078431, 1,
-0.3124932, 0.5606229, -1.881703, 0, 1, 0.4117647, 1,
-0.3093602, 0.470643, -0.3423917, 0, 1, 0.4196078, 1,
-0.3089065, -0.7266197, -2.48738, 0, 1, 0.4235294, 1,
-0.3087758, 0.8789913, 0.3648639, 0, 1, 0.4313726, 1,
-0.2983959, -0.8233352, -2.042655, 0, 1, 0.4352941, 1,
-0.2964428, 0.0001764562, -0.3575834, 0, 1, 0.4431373, 1,
-0.2957533, 0.1788313, -0.8343883, 0, 1, 0.4470588, 1,
-0.2944897, -1.236108, -3.826718, 0, 1, 0.454902, 1,
-0.2939084, 0.5824568, -0.06351364, 0, 1, 0.4588235, 1,
-0.2927073, -0.9104809, -4.337314, 0, 1, 0.4666667, 1,
-0.2913719, -2.050964, -3.607015, 0, 1, 0.4705882, 1,
-0.2883125, -0.7495661, -3.181879, 0, 1, 0.4784314, 1,
-0.2840638, -1.187043, -2.005738, 0, 1, 0.4823529, 1,
-0.2805116, -0.1498879, -2.524348, 0, 1, 0.4901961, 1,
-0.2781282, -1.566939, -3.534883, 0, 1, 0.4941176, 1,
-0.276656, -0.06360926, -3.545386, 0, 1, 0.5019608, 1,
-0.2757902, -0.3640631, -1.953516, 0, 1, 0.509804, 1,
-0.2697665, -0.6040355, -4.495506, 0, 1, 0.5137255, 1,
-0.2672746, -0.1678508, -2.540994, 0, 1, 0.5215687, 1,
-0.2653076, -1.23508, -4.668211, 0, 1, 0.5254902, 1,
-0.2651141, -0.944842, -0.8262439, 0, 1, 0.5333334, 1,
-0.2639882, -0.4833252, -4.435486, 0, 1, 0.5372549, 1,
-0.2636312, -0.1160847, -1.086383, 0, 1, 0.5450981, 1,
-0.262196, 0.3006705, -0.8403857, 0, 1, 0.5490196, 1,
-0.2608903, -0.6066551, -2.849219, 0, 1, 0.5568628, 1,
-0.2531917, -0.5766318, -3.65978, 0, 1, 0.5607843, 1,
-0.251909, -0.1625116, -2.458549, 0, 1, 0.5686275, 1,
-0.2497451, 0.5847983, -1.142721, 0, 1, 0.572549, 1,
-0.2468899, 0.7529576, -1.502555, 0, 1, 0.5803922, 1,
-0.2346064, -0.9892794, -4.643231, 0, 1, 0.5843138, 1,
-0.232848, 2.035559, -1.552079, 0, 1, 0.5921569, 1,
-0.231487, -0.8037103, -1.092404, 0, 1, 0.5960785, 1,
-0.2298604, -0.02694454, -3.376713, 0, 1, 0.6039216, 1,
-0.2254565, -0.020754, -1.604329, 0, 1, 0.6117647, 1,
-0.2248856, 1.755507, 0.5818914, 0, 1, 0.6156863, 1,
-0.2237176, 0.8515802, -2.439023, 0, 1, 0.6235294, 1,
-0.2217769, 0.5641677, -0.9050793, 0, 1, 0.627451, 1,
-0.2136333, -0.7331296, -3.182378, 0, 1, 0.6352941, 1,
-0.2121751, 0.0773633, -0.2882058, 0, 1, 0.6392157, 1,
-0.2110434, 0.4658668, -0.8103507, 0, 1, 0.6470588, 1,
-0.2047888, 0.08215514, -1.635696, 0, 1, 0.6509804, 1,
-0.2024468, 0.8379487, 0.3793165, 0, 1, 0.6588235, 1,
-0.2023221, -0.4987423, -3.228664, 0, 1, 0.6627451, 1,
-0.2012776, 1.12223, -2.117433, 0, 1, 0.6705883, 1,
-0.1974122, -0.04177213, -1.025516, 0, 1, 0.6745098, 1,
-0.1945964, -0.4633751, -2.034664, 0, 1, 0.682353, 1,
-0.1921825, -0.8999574, -2.845776, 0, 1, 0.6862745, 1,
-0.1918223, -0.8274583, -0.5514421, 0, 1, 0.6941177, 1,
-0.181922, 1.35466, -0.2071681, 0, 1, 0.7019608, 1,
-0.1778471, -0.7061858, -2.680316, 0, 1, 0.7058824, 1,
-0.174738, 0.3357404, 0.2140204, 0, 1, 0.7137255, 1,
-0.174228, 2.541602, -0.9392647, 0, 1, 0.7176471, 1,
-0.1736606, 0.4053513, -0.4832386, 0, 1, 0.7254902, 1,
-0.1734616, -0.6430547, -3.914478, 0, 1, 0.7294118, 1,
-0.1725577, 0.05048482, -2.339441, 0, 1, 0.7372549, 1,
-0.171583, -0.06708955, -0.8606067, 0, 1, 0.7411765, 1,
-0.1713387, -1.9443, -2.444356, 0, 1, 0.7490196, 1,
-0.1653678, 1.828675, -0.04667491, 0, 1, 0.7529412, 1,
-0.1624429, 0.4570897, -1.448023, 0, 1, 0.7607843, 1,
-0.1601989, -0.7076529, -2.362894, 0, 1, 0.7647059, 1,
-0.1564584, -1.218237, -2.72481, 0, 1, 0.772549, 1,
-0.1563029, 0.08139263, -0.09364329, 0, 1, 0.7764706, 1,
-0.1554962, -1.606418, -2.597094, 0, 1, 0.7843137, 1,
-0.1548864, 0.4418392, 0.599282, 0, 1, 0.7882353, 1,
-0.1516422, -1.18134, -3.120439, 0, 1, 0.7960784, 1,
-0.1504703, 0.429921, 0.4521543, 0, 1, 0.8039216, 1,
-0.1489156, -0.2598318, -2.958901, 0, 1, 0.8078431, 1,
-0.1467825, -0.140158, -0.3293842, 0, 1, 0.8156863, 1,
-0.1429194, -0.6186816, -3.131677, 0, 1, 0.8196079, 1,
-0.1410444, -0.6918858, -1.977981, 0, 1, 0.827451, 1,
-0.1332383, 0.6749669, -2.148412, 0, 1, 0.8313726, 1,
-0.1293339, -0.7711888, -5.788648, 0, 1, 0.8392157, 1,
-0.1279555, 0.5049742, 0.9963401, 0, 1, 0.8431373, 1,
-0.1274983, 1.075807, 0.2260543, 0, 1, 0.8509804, 1,
-0.1269173, 0.3730046, -0.6009013, 0, 1, 0.854902, 1,
-0.1268172, -1.170947, -3.571346, 0, 1, 0.8627451, 1,
-0.1245568, -1.013845, -4.257584, 0, 1, 0.8666667, 1,
-0.1228515, 1.672866, 1.25906, 0, 1, 0.8745098, 1,
-0.1134627, 1.858085, -0.7431344, 0, 1, 0.8784314, 1,
-0.1129277, 0.6134654, -0.8141599, 0, 1, 0.8862745, 1,
-0.1123244, 1.013914, 0.937116, 0, 1, 0.8901961, 1,
-0.1098517, -0.2120203, -1.737281, 0, 1, 0.8980392, 1,
-0.1068462, 0.3443513, -0.1875625, 0, 1, 0.9058824, 1,
-0.1067173, 0.4120439, 0.3446023, 0, 1, 0.9098039, 1,
-0.1036082, 0.7570885, -0.4094017, 0, 1, 0.9176471, 1,
-0.09932695, -0.3876946, -2.148933, 0, 1, 0.9215686, 1,
-0.091824, -0.2838493, -2.081602, 0, 1, 0.9294118, 1,
-0.088749, 0.4235995, -0.08074533, 0, 1, 0.9333333, 1,
-0.0833579, 0.9574805, 0.4398146, 0, 1, 0.9411765, 1,
-0.0788742, 0.5997917, 1.838905, 0, 1, 0.945098, 1,
-0.07737967, -0.03030833, -5.226882, 0, 1, 0.9529412, 1,
-0.07603826, 0.5879385, -0.6422741, 0, 1, 0.9568627, 1,
-0.07296018, 0.6173859, -0.3603527, 0, 1, 0.9647059, 1,
-0.06981925, -0.8106214, -4.309485, 0, 1, 0.9686275, 1,
-0.065492, 0.193225, 0.1353093, 0, 1, 0.9764706, 1,
-0.06302421, -2.107303, -4.246242, 0, 1, 0.9803922, 1,
-0.06129232, 0.8727987, 0.1220474, 0, 1, 0.9882353, 1,
-0.06129061, 0.2306294, 0.3776983, 0, 1, 0.9921569, 1,
-0.05868421, 1.645068, -1.937775, 0, 1, 1, 1,
-0.05843264, 1.312311, 0.05971016, 0, 0.9921569, 1, 1,
-0.05621078, 0.5069042, -0.3332056, 0, 0.9882353, 1, 1,
-0.05617476, -0.218741, -3.162615, 0, 0.9803922, 1, 1,
-0.05587792, -1.003198, -2.552267, 0, 0.9764706, 1, 1,
-0.05117007, 0.02168546, -2.577348, 0, 0.9686275, 1, 1,
-0.05096119, -0.2621752, -3.482635, 0, 0.9647059, 1, 1,
-0.0466205, -0.634413, -2.940021, 0, 0.9568627, 1, 1,
-0.04389805, 0.4798208, -1.170339, 0, 0.9529412, 1, 1,
-0.03904385, 2.035024, -1.178804, 0, 0.945098, 1, 1,
-0.0367209, 2.076867, -1.945599, 0, 0.9411765, 1, 1,
-0.03577468, 1.637941, -0.561298, 0, 0.9333333, 1, 1,
-0.03507188, 0.7056363, -0.5892908, 0, 0.9294118, 1, 1,
-0.03259298, 0.4362949, 1.181296, 0, 0.9215686, 1, 1,
-0.03252467, -0.5875809, -2.467746, 0, 0.9176471, 1, 1,
-0.02970727, -0.6884187, -2.638836, 0, 0.9098039, 1, 1,
-0.02704226, -1.758988, -2.59241, 0, 0.9058824, 1, 1,
-0.02465514, -1.372881, -3.048015, 0, 0.8980392, 1, 1,
-0.02388129, 0.1379905, -1.237852, 0, 0.8901961, 1, 1,
-0.02361527, -1.017849, -4.670352, 0, 0.8862745, 1, 1,
-0.02198741, -1.262537, -4.473395, 0, 0.8784314, 1, 1,
-0.02125289, -1.480131, -4.924178, 0, 0.8745098, 1, 1,
-0.01345991, 0.7456636, 0.8679466, 0, 0.8666667, 1, 1,
-0.01266516, -0.7185475, -1.018501, 0, 0.8627451, 1, 1,
-0.01060063, 0.5450642, 0.2026717, 0, 0.854902, 1, 1,
-0.01013027, -0.8187853, -1.375666, 0, 0.8509804, 1, 1,
-0.006402484, 0.9767398, -0.05768785, 0, 0.8431373, 1, 1,
-0.005806758, 0.498632, -0.4590317, 0, 0.8392157, 1, 1,
-0.004083953, 1.504111, 0.5165609, 0, 0.8313726, 1, 1,
-0.001240987, -0.4255713, -2.749496, 0, 0.827451, 1, 1,
0.001541363, -2.584072, 6.00212, 0, 0.8196079, 1, 1,
0.001822218, -0.05605451, 3.691287, 0, 0.8156863, 1, 1,
0.006604889, 0.04392819, 0.339488, 0, 0.8078431, 1, 1,
0.009396909, -1.365757, 2.793453, 0, 0.8039216, 1, 1,
0.01097319, -0.2693576, 3.999131, 0, 0.7960784, 1, 1,
0.01247052, 1.020462, -0.7497923, 0, 0.7882353, 1, 1,
0.01315343, -1.032055, 4.089107, 0, 0.7843137, 1, 1,
0.0131889, -0.8880042, 2.56005, 0, 0.7764706, 1, 1,
0.01343449, -0.02391317, 1.980847, 0, 0.772549, 1, 1,
0.01751421, 0.02637834, 0.5997037, 0, 0.7647059, 1, 1,
0.02617156, 0.791431, 0.7487856, 0, 0.7607843, 1, 1,
0.0310232, -0.9676058, 4.096747, 0, 0.7529412, 1, 1,
0.03421564, -0.1241264, 4.932597, 0, 0.7490196, 1, 1,
0.03553533, -1.660011, 2.647412, 0, 0.7411765, 1, 1,
0.04495457, 0.4164307, -1.441474, 0, 0.7372549, 1, 1,
0.04737486, -0.512058, 3.355156, 0, 0.7294118, 1, 1,
0.04787766, 0.1208089, 0.1081254, 0, 0.7254902, 1, 1,
0.05131951, 0.05850979, 1.897891, 0, 0.7176471, 1, 1,
0.05232473, -0.4355925, 2.486554, 0, 0.7137255, 1, 1,
0.05361629, 1.704558, -0.731247, 0, 0.7058824, 1, 1,
0.05623328, 0.1287907, -0.2655197, 0, 0.6980392, 1, 1,
0.05632969, 0.04505265, 1.576016, 0, 0.6941177, 1, 1,
0.05709681, 1.08917, -0.9233561, 0, 0.6862745, 1, 1,
0.0652533, -1.921227, 2.944314, 0, 0.682353, 1, 1,
0.06980646, -0.2521016, 3.270411, 0, 0.6745098, 1, 1,
0.0702429, -2.481969, 3.568278, 0, 0.6705883, 1, 1,
0.08046631, 0.01480422, 2.143887, 0, 0.6627451, 1, 1,
0.08185924, -0.1744508, 2.463072, 0, 0.6588235, 1, 1,
0.08455217, 0.2088188, -0.848989, 0, 0.6509804, 1, 1,
0.08606406, -2.563565, 3.619982, 0, 0.6470588, 1, 1,
0.08708829, 0.7777261, -1.037689, 0, 0.6392157, 1, 1,
0.0893603, -0.5340648, 3.985013, 0, 0.6352941, 1, 1,
0.09103709, 0.08948711, 1.015748, 0, 0.627451, 1, 1,
0.09166321, -0.6250728, 2.931769, 0, 0.6235294, 1, 1,
0.09544344, 0.04476908, 0.4695618, 0, 0.6156863, 1, 1,
0.1003984, 1.876118, 1.923313, 0, 0.6117647, 1, 1,
0.1067635, 1.441919, 0.4475607, 0, 0.6039216, 1, 1,
0.1070189, 1.656604, 0.8437809, 0, 0.5960785, 1, 1,
0.110405, 0.4612161, -1.103802, 0, 0.5921569, 1, 1,
0.1105657, 1.753504, 0.182673, 0, 0.5843138, 1, 1,
0.1112081, -0.01510322, -0.04955542, 0, 0.5803922, 1, 1,
0.1184363, -0.05186857, 1.964077, 0, 0.572549, 1, 1,
0.1211499, -0.3140603, 2.104217, 0, 0.5686275, 1, 1,
0.131544, -0.5552567, 2.088551, 0, 0.5607843, 1, 1,
0.1322816, 0.8553415, 1.024311, 0, 0.5568628, 1, 1,
0.1346488, -1.271862, 4.792414, 0, 0.5490196, 1, 1,
0.1360872, 0.4466859, 0.1464909, 0, 0.5450981, 1, 1,
0.1362247, -0.5522982, 4.123825, 0, 0.5372549, 1, 1,
0.1372658, -0.7565834, 3.033586, 0, 0.5333334, 1, 1,
0.138918, 0.7648591, -0.9656459, 0, 0.5254902, 1, 1,
0.1402838, -0.1827329, 2.792027, 0, 0.5215687, 1, 1,
0.1427421, -0.38363, 3.144997, 0, 0.5137255, 1, 1,
0.1458767, 0.5139787, 0.1848458, 0, 0.509804, 1, 1,
0.146339, 1.226976, -0.5731496, 0, 0.5019608, 1, 1,
0.1477549, 0.4208027, -0.243864, 0, 0.4941176, 1, 1,
0.150511, -0.0939503, 0.8048324, 0, 0.4901961, 1, 1,
0.158518, 0.4246691, 1.470499, 0, 0.4823529, 1, 1,
0.1659794, 1.259112, 0.2447003, 0, 0.4784314, 1, 1,
0.1663844, -0.3149815, 1.895282, 0, 0.4705882, 1, 1,
0.1685976, -0.4841927, 4.737489, 0, 0.4666667, 1, 1,
0.1719207, -1.615341, 3.151385, 0, 0.4588235, 1, 1,
0.1830479, 0.7697961, -0.5306082, 0, 0.454902, 1, 1,
0.1839053, -0.6842927, 2.876217, 0, 0.4470588, 1, 1,
0.1859442, 0.102598, 1.531707, 0, 0.4431373, 1, 1,
0.1878966, 1.116406, -0.7133436, 0, 0.4352941, 1, 1,
0.19354, -0.8510398, 3.197011, 0, 0.4313726, 1, 1,
0.1945359, 0.5312144, 1.031095, 0, 0.4235294, 1, 1,
0.1998152, 0.7396318, -0.3633318, 0, 0.4196078, 1, 1,
0.1998564, 1.74585, 0.1952743, 0, 0.4117647, 1, 1,
0.2009697, 1.631682, -0.4818166, 0, 0.4078431, 1, 1,
0.2019958, -0.7517444, 2.869487, 0, 0.4, 1, 1,
0.2114779, 1.290611, -1.354236, 0, 0.3921569, 1, 1,
0.2119871, -1.122048, 1.858349, 0, 0.3882353, 1, 1,
0.2130143, -0.7499181, 0.6941768, 0, 0.3803922, 1, 1,
0.2198504, -0.9624262, 4.220477, 0, 0.3764706, 1, 1,
0.2213099, 0.1895081, 0.5272222, 0, 0.3686275, 1, 1,
0.22742, -0.3877598, 3.17421, 0, 0.3647059, 1, 1,
0.227633, 0.7553424, -0.8260759, 0, 0.3568628, 1, 1,
0.2281729, 0.8852236, 0.01563349, 0, 0.3529412, 1, 1,
0.2286039, -2.440677, 2.097069, 0, 0.345098, 1, 1,
0.231926, 0.455466, 1.117872, 0, 0.3411765, 1, 1,
0.2334962, 0.644041, 0.3790038, 0, 0.3333333, 1, 1,
0.2335288, -0.5027749, 1.811607, 0, 0.3294118, 1, 1,
0.233913, 0.666522, -0.3977717, 0, 0.3215686, 1, 1,
0.234311, -0.7788165, 2.624484, 0, 0.3176471, 1, 1,
0.2347818, 1.327927, -0.06590123, 0, 0.3098039, 1, 1,
0.2375647, 1.351156, -1.973674, 0, 0.3058824, 1, 1,
0.2403617, 0.08702479, 0.5611523, 0, 0.2980392, 1, 1,
0.240499, 0.191887, -0.03285212, 0, 0.2901961, 1, 1,
0.2424438, 1.149094, -0.02599781, 0, 0.2862745, 1, 1,
0.2511552, -0.3452045, 3.210707, 0, 0.2784314, 1, 1,
0.25152, 1.763105, -0.846517, 0, 0.2745098, 1, 1,
0.2601692, -0.2631584, 0.04189531, 0, 0.2666667, 1, 1,
0.2627246, -0.3187608, 2.143784, 0, 0.2627451, 1, 1,
0.2653583, -0.6247981, 4.398271, 0, 0.254902, 1, 1,
0.2669978, -0.1986017, 2.189911, 0, 0.2509804, 1, 1,
0.2732427, 1.111227, -1.229373, 0, 0.2431373, 1, 1,
0.2756087, -1.432464, 3.932567, 0, 0.2392157, 1, 1,
0.2775002, -0.1675135, 2.696652, 0, 0.2313726, 1, 1,
0.2804607, -0.4069444, 0.2123298, 0, 0.227451, 1, 1,
0.2808225, -1.023754, 1.966308, 0, 0.2196078, 1, 1,
0.286124, -0.412991, 1.795582, 0, 0.2156863, 1, 1,
0.2916202, 0.2125648, 1.336551, 0, 0.2078431, 1, 1,
0.2928842, -1.506029, 3.945613, 0, 0.2039216, 1, 1,
0.3020565, -0.2405767, 0.9588336, 0, 0.1960784, 1, 1,
0.3061076, 0.777271, 2.621301, 0, 0.1882353, 1, 1,
0.3073979, 0.7981589, 0.3382847, 0, 0.1843137, 1, 1,
0.3098352, 0.1740297, 1.094401, 0, 0.1764706, 1, 1,
0.3118811, 1.544779, -0.272955, 0, 0.172549, 1, 1,
0.317904, -1.413606, -0.1311644, 0, 0.1647059, 1, 1,
0.3265182, -1.573977, 4.136395, 0, 0.1607843, 1, 1,
0.3328495, -0.7468711, 2.4899, 0, 0.1529412, 1, 1,
0.3345969, -0.6040009, 2.514452, 0, 0.1490196, 1, 1,
0.3396417, 0.4530631, 0.7654877, 0, 0.1411765, 1, 1,
0.3473548, -1.439631, 2.886528, 0, 0.1372549, 1, 1,
0.3594908, -0.5712509, 1.83469, 0, 0.1294118, 1, 1,
0.3667266, -0.5855965, 3.310936, 0, 0.1254902, 1, 1,
0.3679681, -0.1630406, 2.288012, 0, 0.1176471, 1, 1,
0.3682732, 2.064861, -0.8665636, 0, 0.1137255, 1, 1,
0.3700012, 1.251311, 1.036892, 0, 0.1058824, 1, 1,
0.3720871, -0.6977077, 1.038223, 0, 0.09803922, 1, 1,
0.3738323, -1.111967, 2.91657, 0, 0.09411765, 1, 1,
0.3837855, -1.811147, 3.191343, 0, 0.08627451, 1, 1,
0.3846603, -1.022768, 3.375988, 0, 0.08235294, 1, 1,
0.3858893, -1.123227, 2.532464, 0, 0.07450981, 1, 1,
0.3900368, 0.8513671, -0.3245973, 0, 0.07058824, 1, 1,
0.3904689, 0.6890702, 1.063696, 0, 0.0627451, 1, 1,
0.392138, -0.8826149, 1.825433, 0, 0.05882353, 1, 1,
0.4044156, 0.9309459, 0.7386789, 0, 0.05098039, 1, 1,
0.4047494, 0.06033629, 1.414316, 0, 0.04705882, 1, 1,
0.404884, 0.8233784, -0.3202226, 0, 0.03921569, 1, 1,
0.40497, -2.545861, 2.82955, 0, 0.03529412, 1, 1,
0.4061102, 0.9181334, 1.030545, 0, 0.02745098, 1, 1,
0.4112509, 0.103494, 0.9603823, 0, 0.02352941, 1, 1,
0.4114072, -0.2702279, 0.9992399, 0, 0.01568628, 1, 1,
0.4124587, 1.495858, -0.2406104, 0, 0.01176471, 1, 1,
0.4143794, -1.021052, 2.608506, 0, 0.003921569, 1, 1,
0.4213876, 1.128511, 0.1099361, 0.003921569, 0, 1, 1,
0.4235463, -0.8701875, 4.047191, 0.007843138, 0, 1, 1,
0.427378, 0.4750578, 0.3574114, 0.01568628, 0, 1, 1,
0.429994, -1.351273, 3.66922, 0.01960784, 0, 1, 1,
0.4308507, 0.5129024, -0.2304964, 0.02745098, 0, 1, 1,
0.4339921, 0.8529313, -0.9147627, 0.03137255, 0, 1, 1,
0.4343978, 0.4244861, 0.2267347, 0.03921569, 0, 1, 1,
0.4359792, -0.8091484, 2.928792, 0.04313726, 0, 1, 1,
0.43854, -0.1061673, 2.728017, 0.05098039, 0, 1, 1,
0.4387098, 0.991621, 1.066591, 0.05490196, 0, 1, 1,
0.4400975, -1.103518, 2.988583, 0.0627451, 0, 1, 1,
0.4434809, 1.459654, 1.440795, 0.06666667, 0, 1, 1,
0.4436924, 1.43779, -1.340767, 0.07450981, 0, 1, 1,
0.4457678, -1.312429, 3.414506, 0.07843138, 0, 1, 1,
0.4482248, 0.4342446, 1.248713, 0.08627451, 0, 1, 1,
0.449858, -1.012015, 2.760462, 0.09019608, 0, 1, 1,
0.4588349, -1.157847, 1.827069, 0.09803922, 0, 1, 1,
0.4597706, 0.8260223, 0.475672, 0.1058824, 0, 1, 1,
0.4601351, -0.09509106, 2.756747, 0.1098039, 0, 1, 1,
0.4630775, -1.876256, 2.896191, 0.1176471, 0, 1, 1,
0.4635985, -0.680675, 2.422989, 0.1215686, 0, 1, 1,
0.4641986, -0.368032, 2.079502, 0.1294118, 0, 1, 1,
0.4653746, -1.070915, 1.079414, 0.1333333, 0, 1, 1,
0.4722638, 1.193642, -0.1698735, 0.1411765, 0, 1, 1,
0.4737574, 0.4736586, 1.351617, 0.145098, 0, 1, 1,
0.4797127, -0.6134555, 3.673155, 0.1529412, 0, 1, 1,
0.4922392, -1.821225, 1.363651, 0.1568628, 0, 1, 1,
0.4952514, 0.002681991, 1.18567, 0.1647059, 0, 1, 1,
0.4957135, 1.295149, 0.4534008, 0.1686275, 0, 1, 1,
0.4967656, -0.1170054, 2.065573, 0.1764706, 0, 1, 1,
0.496943, 0.635098, 0.2128308, 0.1803922, 0, 1, 1,
0.4988212, -1.225069, 3.950985, 0.1882353, 0, 1, 1,
0.5002462, 0.8631312, 0.6209121, 0.1921569, 0, 1, 1,
0.5053643, -0.9054547, 3.180422, 0.2, 0, 1, 1,
0.5065366, 0.8576475, 2.238708, 0.2078431, 0, 1, 1,
0.5073424, 0.5811924, 0.5378135, 0.2117647, 0, 1, 1,
0.5095516, -2.404962, 3.229216, 0.2196078, 0, 1, 1,
0.5105751, 0.3917072, -0.02589637, 0.2235294, 0, 1, 1,
0.5146273, -0.994996, 2.407251, 0.2313726, 0, 1, 1,
0.5160643, -1.262086, 3.796472, 0.2352941, 0, 1, 1,
0.5248377, -0.9692491, 1.660282, 0.2431373, 0, 1, 1,
0.5264134, -0.7744723, 2.30742, 0.2470588, 0, 1, 1,
0.5287023, -0.6993727, 0.9780834, 0.254902, 0, 1, 1,
0.5293063, 0.5902869, 0.7721608, 0.2588235, 0, 1, 1,
0.5308676, 0.3265898, 0.9983826, 0.2666667, 0, 1, 1,
0.5373305, 2.704928, -0.3000494, 0.2705882, 0, 1, 1,
0.5432331, 1.188508, 1.751245, 0.2784314, 0, 1, 1,
0.5449745, -1.461951, 3.464652, 0.282353, 0, 1, 1,
0.549161, -0.2647773, 3.988878, 0.2901961, 0, 1, 1,
0.5506341, -2.375214, 1.868433, 0.2941177, 0, 1, 1,
0.5511769, 0.4293924, 0.4664161, 0.3019608, 0, 1, 1,
0.5524336, 0.694209, 1.075904, 0.3098039, 0, 1, 1,
0.5527903, -0.7443507, 3.740288, 0.3137255, 0, 1, 1,
0.5541571, 0.183843, 2.612008, 0.3215686, 0, 1, 1,
0.558089, -0.3073633, 1.386721, 0.3254902, 0, 1, 1,
0.5633959, -2.517318, 1.215395, 0.3333333, 0, 1, 1,
0.5687875, -1.494086, 3.586998, 0.3372549, 0, 1, 1,
0.5696616, 0.03872554, 2.708076, 0.345098, 0, 1, 1,
0.5741505, -1.335604, 3.533774, 0.3490196, 0, 1, 1,
0.5808194, -0.2611579, 2.882392, 0.3568628, 0, 1, 1,
0.58548, 0.03646748, 1.838231, 0.3607843, 0, 1, 1,
0.5878069, 1.68921, 0.9098769, 0.3686275, 0, 1, 1,
0.5887405, -0.4468333, 3.596202, 0.372549, 0, 1, 1,
0.5889516, -0.2141092, 3.900359, 0.3803922, 0, 1, 1,
0.5893267, 1.465204, 0.9629349, 0.3843137, 0, 1, 1,
0.5952671, 1.023947, 0.7738937, 0.3921569, 0, 1, 1,
0.5987595, 1.841073, 1.379209, 0.3960784, 0, 1, 1,
0.5991731, -1.064151, 3.911546, 0.4039216, 0, 1, 1,
0.6008328, 1.456628, 1.239792, 0.4117647, 0, 1, 1,
0.6093883, 0.9107559, 1.351575, 0.4156863, 0, 1, 1,
0.6094513, 1.278501, 0.4893373, 0.4235294, 0, 1, 1,
0.6101254, 0.859774, 1.289341, 0.427451, 0, 1, 1,
0.6102781, -0.4940099, 2.355113, 0.4352941, 0, 1, 1,
0.6157305, 0.257916, 0.3395552, 0.4392157, 0, 1, 1,
0.6200646, -0.7422833, 2.81119, 0.4470588, 0, 1, 1,
0.6265141, -0.8324115, 2.327978, 0.4509804, 0, 1, 1,
0.6269798, 0.7480013, 1.854761, 0.4588235, 0, 1, 1,
0.6315197, -0.873445, 3.505301, 0.4627451, 0, 1, 1,
0.6340245, 2.402614, -0.8234433, 0.4705882, 0, 1, 1,
0.6347471, 2.630551, -0.5119599, 0.4745098, 0, 1, 1,
0.6371577, 0.5985735, 2.629827, 0.4823529, 0, 1, 1,
0.6382011, -0.7001503, 2.099547, 0.4862745, 0, 1, 1,
0.6390354, -0.4627829, 2.352623, 0.4941176, 0, 1, 1,
0.6390651, 0.1535018, -0.1140738, 0.5019608, 0, 1, 1,
0.6399284, 0.1554239, 2.219839, 0.5058824, 0, 1, 1,
0.6415084, -1.068504, 3.128987, 0.5137255, 0, 1, 1,
0.6418743, -1.13687, 3.636076, 0.5176471, 0, 1, 1,
0.6426402, -0.2405526, 2.019852, 0.5254902, 0, 1, 1,
0.6433951, 0.9250766, 0.1822877, 0.5294118, 0, 1, 1,
0.6437078, -0.3188536, 3.053957, 0.5372549, 0, 1, 1,
0.6554793, -1.797694, 3.204722, 0.5411765, 0, 1, 1,
0.6555249, 0.2005265, 3.057247, 0.5490196, 0, 1, 1,
0.6658318, 0.6997349, 0.4832082, 0.5529412, 0, 1, 1,
0.6658452, 0.9634412, 0.1581616, 0.5607843, 0, 1, 1,
0.6707019, -0.2832054, 2.521277, 0.5647059, 0, 1, 1,
0.6742377, 1.021098, 0.257631, 0.572549, 0, 1, 1,
0.6750512, -1.132255, 3.766722, 0.5764706, 0, 1, 1,
0.6750799, 0.2469763, 1.114997, 0.5843138, 0, 1, 1,
0.6773136, 1.820586, 1.274681, 0.5882353, 0, 1, 1,
0.6778435, 0.6561103, 3.075663, 0.5960785, 0, 1, 1,
0.6810488, -0.2488369, 3.707164, 0.6039216, 0, 1, 1,
0.6832582, -0.05309403, 2.329653, 0.6078432, 0, 1, 1,
0.6955194, 1.489742, 1.35758, 0.6156863, 0, 1, 1,
0.6991739, 1.415739, 0.3240567, 0.6196079, 0, 1, 1,
0.705165, 0.7906194, 0.4602242, 0.627451, 0, 1, 1,
0.7067126, -0.1956512, 0.7001403, 0.6313726, 0, 1, 1,
0.709419, 0.5744156, 1.382513, 0.6392157, 0, 1, 1,
0.7110116, 0.1444385, 1.842546, 0.6431373, 0, 1, 1,
0.7135556, 0.1760275, 1.950943, 0.6509804, 0, 1, 1,
0.7201846, 1.722071, -0.8410264, 0.654902, 0, 1, 1,
0.7243006, -0.5469012, 1.94659, 0.6627451, 0, 1, 1,
0.7266177, 0.07811784, 2.097323, 0.6666667, 0, 1, 1,
0.7293863, 0.5207592, 1.399101, 0.6745098, 0, 1, 1,
0.7451478, 0.3045489, 1.330209, 0.6784314, 0, 1, 1,
0.7473397, -0.6329754, 1.528085, 0.6862745, 0, 1, 1,
0.7484125, 0.4289013, 3.121918, 0.6901961, 0, 1, 1,
0.7515618, -0.4813346, 1.97758, 0.6980392, 0, 1, 1,
0.756839, 0.9407035, 0.1143568, 0.7058824, 0, 1, 1,
0.7578309, -1.171428, 3.157969, 0.7098039, 0, 1, 1,
0.757834, 0.1455285, 1.956432, 0.7176471, 0, 1, 1,
0.7591229, -0.6886812, 2.515296, 0.7215686, 0, 1, 1,
0.759137, 0.003195706, 3.744196, 0.7294118, 0, 1, 1,
0.7647994, -0.9986058, -1.173032, 0.7333333, 0, 1, 1,
0.7687021, -2.238816, 3.522602, 0.7411765, 0, 1, 1,
0.7727851, -1.222937, 2.190159, 0.7450981, 0, 1, 1,
0.7733462, 1.080867, 1.230371, 0.7529412, 0, 1, 1,
0.7800248, 1.160616, 1.068215, 0.7568628, 0, 1, 1,
0.7865013, -0.3130846, 0.7189843, 0.7647059, 0, 1, 1,
0.7874984, 1.463217, 1.017942, 0.7686275, 0, 1, 1,
0.7885807, 0.3243161, 0.8959649, 0.7764706, 0, 1, 1,
0.790046, -0.6479263, 3.384793, 0.7803922, 0, 1, 1,
0.7964428, -1.218193, 2.907246, 0.7882353, 0, 1, 1,
0.8027037, -0.9539286, 1.183164, 0.7921569, 0, 1, 1,
0.8046649, 0.3456498, 0.833795, 0.8, 0, 1, 1,
0.813492, 1.098449, -0.4363766, 0.8078431, 0, 1, 1,
0.8146434, -0.2773421, 1.713852, 0.8117647, 0, 1, 1,
0.817126, -1.641668, 2.12776, 0.8196079, 0, 1, 1,
0.819697, 1.650968, 1.347934, 0.8235294, 0, 1, 1,
0.8227298, 0.05824066, 2.721664, 0.8313726, 0, 1, 1,
0.8237741, -0.2211794, 2.921826, 0.8352941, 0, 1, 1,
0.8242006, -1.147339, 2.605464, 0.8431373, 0, 1, 1,
0.8243713, 0.6529292, 2.17308, 0.8470588, 0, 1, 1,
0.8250191, -0.05048583, 1.867976, 0.854902, 0, 1, 1,
0.8307356, -0.6948055, 3.929501, 0.8588235, 0, 1, 1,
0.832643, -0.06195835, 1.040695, 0.8666667, 0, 1, 1,
0.8385029, 1.025411, 0.9586505, 0.8705882, 0, 1, 1,
0.8388475, 0.1507722, 2.683517, 0.8784314, 0, 1, 1,
0.8410565, 0.8187298, 0.5841174, 0.8823529, 0, 1, 1,
0.8468872, -0.3405012, 2.879069, 0.8901961, 0, 1, 1,
0.8489816, -0.7814946, 1.23401, 0.8941177, 0, 1, 1,
0.8496308, 0.252064, 1.051348, 0.9019608, 0, 1, 1,
0.8517134, -1.268032, 3.916762, 0.9098039, 0, 1, 1,
0.852859, -1.036502, 1.435322, 0.9137255, 0, 1, 1,
0.8550881, -0.9318384, 1.815989, 0.9215686, 0, 1, 1,
0.8604645, 0.3033046, 2.050812, 0.9254902, 0, 1, 1,
0.8695947, 1.696866, 1.183329, 0.9333333, 0, 1, 1,
0.8743333, -0.516165, 1.643933, 0.9372549, 0, 1, 1,
0.877169, -1.16389, 1.866688, 0.945098, 0, 1, 1,
0.8900548, 0.2881981, 3.089681, 0.9490196, 0, 1, 1,
0.8964821, 1.551025, 1.182664, 0.9568627, 0, 1, 1,
0.8982906, 0.8365128, 0.4975443, 0.9607843, 0, 1, 1,
0.8997308, 0.6816229, -0.09500514, 0.9686275, 0, 1, 1,
0.9021047, -0.08891617, 1.184674, 0.972549, 0, 1, 1,
0.9072289, -0.8432658, 3.562599, 0.9803922, 0, 1, 1,
0.909355, -0.1257152, 2.078922, 0.9843137, 0, 1, 1,
0.9117961, 0.5755687, 0.402032, 0.9921569, 0, 1, 1,
0.9120387, 0.8999764, 2.248991, 0.9960784, 0, 1, 1,
0.9246548, 0.8054359, 0.2132386, 1, 0, 0.9960784, 1,
0.9283699, -0.1033662, 0.6246735, 1, 0, 0.9882353, 1,
0.9290962, -0.4741492, 1.283998, 1, 0, 0.9843137, 1,
0.9309374, -1.885898, 2.503747, 1, 0, 0.9764706, 1,
0.9475108, -0.8067651, 2.699869, 1, 0, 0.972549, 1,
0.948014, -0.9852086, 1.529113, 1, 0, 0.9647059, 1,
0.9580109, -1.844013, 2.234652, 1, 0, 0.9607843, 1,
0.9659674, 0.1674643, 0.2356399, 1, 0, 0.9529412, 1,
0.966301, 1.10185, 1.026904, 1, 0, 0.9490196, 1,
0.9673312, -1.238098, 3.161481, 1, 0, 0.9411765, 1,
0.9677631, -0.9466386, 2.691831, 1, 0, 0.9372549, 1,
0.9686627, -0.934145, 1.496079, 1, 0, 0.9294118, 1,
0.9725953, 1.750491, -2.705794, 1, 0, 0.9254902, 1,
0.9737419, -0.8761523, 1.389586, 1, 0, 0.9176471, 1,
0.9742905, -0.7845514, 2.976371, 1, 0, 0.9137255, 1,
0.9746399, 0.7123155, -0.7256939, 1, 0, 0.9058824, 1,
0.974807, 0.602922, 1.204447, 1, 0, 0.9019608, 1,
0.9771327, 0.2635502, 2.115023, 1, 0, 0.8941177, 1,
0.9897667, -0.8894749, 2.250284, 1, 0, 0.8862745, 1,
0.9912365, -0.5375089, 3.619576, 1, 0, 0.8823529, 1,
0.9923507, -0.7470263, 1.473958, 1, 0, 0.8745098, 1,
1.001098, -0.5305549, 0.9125428, 1, 0, 0.8705882, 1,
1.002663, 0.3866548, 0.615875, 1, 0, 0.8627451, 1,
1.013792, 0.9645945, 0.2197471, 1, 0, 0.8588235, 1,
1.014257, -0.7354434, 1.951453, 1, 0, 0.8509804, 1,
1.014974, -2.835742, 0.7052402, 1, 0, 0.8470588, 1,
1.015585, -0.7470123, 1.111582, 1, 0, 0.8392157, 1,
1.029387, -0.2447954, 1.815641, 1, 0, 0.8352941, 1,
1.038178, 1.220946, 1.355586, 1, 0, 0.827451, 1,
1.04854, -0.07105324, 2.102859, 1, 0, 0.8235294, 1,
1.048644, -0.4417388, 2.350508, 1, 0, 0.8156863, 1,
1.055065, 0.02675919, -0.2705238, 1, 0, 0.8117647, 1,
1.058304, -0.7583813, 0.7614108, 1, 0, 0.8039216, 1,
1.05952, 1.186163, 0.4765445, 1, 0, 0.7960784, 1,
1.068989, 1.511212, -1.174475, 1, 0, 0.7921569, 1,
1.06957, 1.03513, 1.666149, 1, 0, 0.7843137, 1,
1.073591, 0.7937174, 1.984086, 1, 0, 0.7803922, 1,
1.078564, -1.440963, 1.919627, 1, 0, 0.772549, 1,
1.079107, -0.9961617, 3.169717, 1, 0, 0.7686275, 1,
1.079185, -0.1137257, 1.750345, 1, 0, 0.7607843, 1,
1.081689, -0.3635807, 1.144771, 1, 0, 0.7568628, 1,
1.081781, -0.172407, 2.527607, 1, 0, 0.7490196, 1,
1.083291, -0.4239155, 3.883427, 1, 0, 0.7450981, 1,
1.085358, 0.1019267, -0.303317, 1, 0, 0.7372549, 1,
1.085515, 0.8080419, 1.151587, 1, 0, 0.7333333, 1,
1.090541, -1.660768, 1.186597, 1, 0, 0.7254902, 1,
1.106367, 0.5844815, 0.9435952, 1, 0, 0.7215686, 1,
1.109032, -1.83968, 3.125928, 1, 0, 0.7137255, 1,
1.114046, -0.5161141, 2.343058, 1, 0, 0.7098039, 1,
1.120295, -0.8934593, 0.1667971, 1, 0, 0.7019608, 1,
1.120934, -0.6028302, 1.639886, 1, 0, 0.6941177, 1,
1.123276, 0.947544, 1.413838, 1, 0, 0.6901961, 1,
1.12557, 1.925471, -0.5112174, 1, 0, 0.682353, 1,
1.13571, 0.4896901, 0.9482228, 1, 0, 0.6784314, 1,
1.158003, -0.5715132, 3.693497, 1, 0, 0.6705883, 1,
1.165074, -0.6108668, 1.428332, 1, 0, 0.6666667, 1,
1.16729, -0.9578447, 1.28344, 1, 0, 0.6588235, 1,
1.170935, 0.5023621, 1.407098, 1, 0, 0.654902, 1,
1.174618, 1.407584, 0.9807568, 1, 0, 0.6470588, 1,
1.174894, -0.02908264, 1.648809, 1, 0, 0.6431373, 1,
1.183467, 1.033149, 1.166735, 1, 0, 0.6352941, 1,
1.19455, 1.72231, 1.283607, 1, 0, 0.6313726, 1,
1.195961, -1.421611, 3.011455, 1, 0, 0.6235294, 1,
1.207793, 0.9813228, 1.629861, 1, 0, 0.6196079, 1,
1.208201, 0.2747278, 3.496073, 1, 0, 0.6117647, 1,
1.211733, -0.2703319, 2.008325, 1, 0, 0.6078432, 1,
1.21932, -0.5327369, 1.99974, 1, 0, 0.6, 1,
1.230942, 0.6895154, 0.9081924, 1, 0, 0.5921569, 1,
1.236886, 0.6988227, 1.126802, 1, 0, 0.5882353, 1,
1.237933, 0.312635, 1.065361, 1, 0, 0.5803922, 1,
1.247439, -0.5548422, 1.486842, 1, 0, 0.5764706, 1,
1.248501, -1.105839, 1.903047, 1, 0, 0.5686275, 1,
1.25017, 1.091125, -0.6290642, 1, 0, 0.5647059, 1,
1.26426, 0.6660887, 1.497766, 1, 0, 0.5568628, 1,
1.264486, 0.9807997, 1.262362, 1, 0, 0.5529412, 1,
1.270831, 0.1637097, 1.25945, 1, 0, 0.5450981, 1,
1.277083, -1.123677, 1.558349, 1, 0, 0.5411765, 1,
1.286984, 0.1888458, 1.584499, 1, 0, 0.5333334, 1,
1.299171, -0.04982688, 0.5862513, 1, 0, 0.5294118, 1,
1.30307, -0.03505151, 1.40955, 1, 0, 0.5215687, 1,
1.312242, 0.7953722, 1.973782, 1, 0, 0.5176471, 1,
1.319428, -1.833272, 3.139149, 1, 0, 0.509804, 1,
1.336176, -2.504812, 2.997976, 1, 0, 0.5058824, 1,
1.341225, 1.009322, -0.6556557, 1, 0, 0.4980392, 1,
1.351905, 0.005752847, 1.030349, 1, 0, 0.4901961, 1,
1.354569, -1.620768, 1.69507, 1, 0, 0.4862745, 1,
1.359044, -0.4690136, 2.345606, 1, 0, 0.4784314, 1,
1.376368, -0.3722658, 1.910465, 1, 0, 0.4745098, 1,
1.377163, 1.15234, 1.960322, 1, 0, 0.4666667, 1,
1.384835, 0.9040049, 1.211069, 1, 0, 0.4627451, 1,
1.387469, 0.4716613, 2.658136, 1, 0, 0.454902, 1,
1.388801, 0.1611424, 1.955866, 1, 0, 0.4509804, 1,
1.389237, 1.08446, 2.443991, 1, 0, 0.4431373, 1,
1.390913, -1.367833, 3.389453, 1, 0, 0.4392157, 1,
1.401394, 0.1453686, 2.444144, 1, 0, 0.4313726, 1,
1.405105, 0.2797585, 1.678601, 1, 0, 0.427451, 1,
1.406227, 0.05613143, 3.441922, 1, 0, 0.4196078, 1,
1.419421, 0.8962927, -0.3994972, 1, 0, 0.4156863, 1,
1.423526, -0.4394725, 1.301714, 1, 0, 0.4078431, 1,
1.429606, -0.4987242, 2.067173, 1, 0, 0.4039216, 1,
1.452666, -0.5458096, 2.238638, 1, 0, 0.3960784, 1,
1.459438, 0.3771871, 3.725666, 1, 0, 0.3882353, 1,
1.462313, -1.405323, 3.507994, 1, 0, 0.3843137, 1,
1.47502, 1.270486, -0.6358802, 1, 0, 0.3764706, 1,
1.493713, 0.4743011, 1.421563, 1, 0, 0.372549, 1,
1.509287, -0.3665467, 2.590904, 1, 0, 0.3647059, 1,
1.517635, 0.2056643, 0.156349, 1, 0, 0.3607843, 1,
1.519563, 1.438639, 1.726853, 1, 0, 0.3529412, 1,
1.519869, 0.9154167, 4.031129, 1, 0, 0.3490196, 1,
1.527469, 2.139694, 2.258254, 1, 0, 0.3411765, 1,
1.530831, -0.9840509, -0.02831625, 1, 0, 0.3372549, 1,
1.532512, 0.3477289, 1.125361, 1, 0, 0.3294118, 1,
1.558222, -0.1723402, 2.115472, 1, 0, 0.3254902, 1,
1.567419, -0.3492753, 1.768713, 1, 0, 0.3176471, 1,
1.574416, 0.9988112, 0.8934158, 1, 0, 0.3137255, 1,
1.576778, 0.9591752, 1.02308, 1, 0, 0.3058824, 1,
1.580805, 0.505293, -0.3967019, 1, 0, 0.2980392, 1,
1.586881, 2.170238, 0.2212907, 1, 0, 0.2941177, 1,
1.59328, 2.045945, -0.5789213, 1, 0, 0.2862745, 1,
1.595209, -0.7904348, 1.855791, 1, 0, 0.282353, 1,
1.603288, -1.079635, 0.9232519, 1, 0, 0.2745098, 1,
1.612539, -0.7185008, 2.100059, 1, 0, 0.2705882, 1,
1.615187, 3.730333, 0.2474345, 1, 0, 0.2627451, 1,
1.625556, 0.3999234, 2.426909, 1, 0, 0.2588235, 1,
1.665351, -0.3233476, 2.18679, 1, 0, 0.2509804, 1,
1.681553, 1.462003, 3.367766, 1, 0, 0.2470588, 1,
1.703925, -1.127505, 1.326406, 1, 0, 0.2392157, 1,
1.706562, -1.27905, 1.178076, 1, 0, 0.2352941, 1,
1.710697, -0.9516878, 3.065054, 1, 0, 0.227451, 1,
1.71232, -1.326867, 2.570566, 1, 0, 0.2235294, 1,
1.71482, -0.2640306, 1.405953, 1, 0, 0.2156863, 1,
1.72209, -0.01838858, 1.126866, 1, 0, 0.2117647, 1,
1.767514, 2.049777, 0.9357675, 1, 0, 0.2039216, 1,
1.769726, -0.4472031, 0.8560588, 1, 0, 0.1960784, 1,
1.777664, 1.830312, 2.82526, 1, 0, 0.1921569, 1,
1.788311, -0.3260125, 0.985214, 1, 0, 0.1843137, 1,
1.793573, -0.759962, 3.228459, 1, 0, 0.1803922, 1,
1.835748, -0.1604059, 1.761586, 1, 0, 0.172549, 1,
1.840119, 0.595448, 2.00726, 1, 0, 0.1686275, 1,
1.846407, 1.013007, 2.731071, 1, 0, 0.1607843, 1,
1.854656, -1.33728, 1.943753, 1, 0, 0.1568628, 1,
1.860195, 1.418691, 1.359982, 1, 0, 0.1490196, 1,
1.872502, -1.272574, 2.654743, 1, 0, 0.145098, 1,
1.873461, -0.6013417, 2.459369, 1, 0, 0.1372549, 1,
1.93632, 1.861049, 0.7488925, 1, 0, 0.1333333, 1,
1.941274, -1.306508, 0.7488439, 1, 0, 0.1254902, 1,
1.957898, -0.06068608, 1.979843, 1, 0, 0.1215686, 1,
2.00624, 1.628184, -0.5211232, 1, 0, 0.1137255, 1,
2.017029, 0.640147, 0.4998317, 1, 0, 0.1098039, 1,
2.035013, 0.3785757, 2.291679, 1, 0, 0.1019608, 1,
2.062295, -0.6557358, 1.974949, 1, 0, 0.09411765, 1,
2.068777, -1.814153, 1.237019, 1, 0, 0.09019608, 1,
2.14636, -0.8899631, 2.391684, 1, 0, 0.08235294, 1,
2.183645, -0.4825045, 2.488278, 1, 0, 0.07843138, 1,
2.276021, 1.251837, -0.9689348, 1, 0, 0.07058824, 1,
2.290362, 0.2914074, 1.412058, 1, 0, 0.06666667, 1,
2.362458, -0.1794843, 2.091676, 1, 0, 0.05882353, 1,
2.410149, 0.3717471, 1.134271, 1, 0, 0.05490196, 1,
2.421285, -0.04617298, 0.06048625, 1, 0, 0.04705882, 1,
2.468233, 0.6464471, -0.2594526, 1, 0, 0.04313726, 1,
2.480433, -0.06480038, 1.076432, 1, 0, 0.03529412, 1,
2.577699, -0.5089387, 2.92206, 1, 0, 0.03137255, 1,
2.596806, -0.1631286, 2.274453, 1, 0, 0.02352941, 1,
2.61365, 0.08192004, 2.214973, 1, 0, 0.01960784, 1,
2.659509, -0.3791767, 1.059391, 1, 0, 0.01176471, 1,
2.746829, 1.210084, 0.7223806, 1, 0, 0.007843138, 1
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
-0.3327743, -4.110304, -7.787183, 0, -0.5, 0.5, 0.5,
-0.3327743, -4.110304, -7.787183, 1, -0.5, 0.5, 0.5,
-0.3327743, -4.110304, -7.787183, 1, 1.5, 0.5, 0.5,
-0.3327743, -4.110304, -7.787183, 0, 1.5, 0.5, 0.5
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
-4.456363, 0.3782011, -7.787183, 0, -0.5, 0.5, 0.5,
-4.456363, 0.3782011, -7.787183, 1, -0.5, 0.5, 0.5,
-4.456363, 0.3782011, -7.787183, 1, 1.5, 0.5, 0.5,
-4.456363, 0.3782011, -7.787183, 0, 1.5, 0.5, 0.5
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
-4.456363, -4.110304, 0.1067359, 0, -0.5, 0.5, 0.5,
-4.456363, -4.110304, 0.1067359, 1, -0.5, 0.5, 0.5,
-4.456363, -4.110304, 0.1067359, 1, 1.5, 0.5, 0.5,
-4.456363, -4.110304, 0.1067359, 0, 1.5, 0.5, 0.5
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
-3, -3.074495, -5.965509,
2, -3.074495, -5.965509,
-3, -3.074495, -5.965509,
-3, -3.24713, -6.269122,
-2, -3.074495, -5.965509,
-2, -3.24713, -6.269122,
-1, -3.074495, -5.965509,
-1, -3.24713, -6.269122,
0, -3.074495, -5.965509,
0, -3.24713, -6.269122,
1, -3.074495, -5.965509,
1, -3.24713, -6.269122,
2, -3.074495, -5.965509,
2, -3.24713, -6.269122
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
-3, -3.592399, -6.876347, 0, -0.5, 0.5, 0.5,
-3, -3.592399, -6.876347, 1, -0.5, 0.5, 0.5,
-3, -3.592399, -6.876347, 1, 1.5, 0.5, 0.5,
-3, -3.592399, -6.876347, 0, 1.5, 0.5, 0.5,
-2, -3.592399, -6.876347, 0, -0.5, 0.5, 0.5,
-2, -3.592399, -6.876347, 1, -0.5, 0.5, 0.5,
-2, -3.592399, -6.876347, 1, 1.5, 0.5, 0.5,
-2, -3.592399, -6.876347, 0, 1.5, 0.5, 0.5,
-1, -3.592399, -6.876347, 0, -0.5, 0.5, 0.5,
-1, -3.592399, -6.876347, 1, -0.5, 0.5, 0.5,
-1, -3.592399, -6.876347, 1, 1.5, 0.5, 0.5,
-1, -3.592399, -6.876347, 0, 1.5, 0.5, 0.5,
0, -3.592399, -6.876347, 0, -0.5, 0.5, 0.5,
0, -3.592399, -6.876347, 1, -0.5, 0.5, 0.5,
0, -3.592399, -6.876347, 1, 1.5, 0.5, 0.5,
0, -3.592399, -6.876347, 0, 1.5, 0.5, 0.5,
1, -3.592399, -6.876347, 0, -0.5, 0.5, 0.5,
1, -3.592399, -6.876347, 1, -0.5, 0.5, 0.5,
1, -3.592399, -6.876347, 1, 1.5, 0.5, 0.5,
1, -3.592399, -6.876347, 0, 1.5, 0.5, 0.5,
2, -3.592399, -6.876347, 0, -0.5, 0.5, 0.5,
2, -3.592399, -6.876347, 1, -0.5, 0.5, 0.5,
2, -3.592399, -6.876347, 1, 1.5, 0.5, 0.5,
2, -3.592399, -6.876347, 0, 1.5, 0.5, 0.5
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
-3.504766, -2, -5.965509,
-3.504766, 3, -5.965509,
-3.504766, -2, -5.965509,
-3.663365, -2, -6.269122,
-3.504766, -1, -5.965509,
-3.663365, -1, -6.269122,
-3.504766, 0, -5.965509,
-3.663365, 0, -6.269122,
-3.504766, 1, -5.965509,
-3.663365, 1, -6.269122,
-3.504766, 2, -5.965509,
-3.663365, 2, -6.269122,
-3.504766, 3, -5.965509,
-3.663365, 3, -6.269122
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
-3.980564, -2, -6.876347, 0, -0.5, 0.5, 0.5,
-3.980564, -2, -6.876347, 1, -0.5, 0.5, 0.5,
-3.980564, -2, -6.876347, 1, 1.5, 0.5, 0.5,
-3.980564, -2, -6.876347, 0, 1.5, 0.5, 0.5,
-3.980564, -1, -6.876347, 0, -0.5, 0.5, 0.5,
-3.980564, -1, -6.876347, 1, -0.5, 0.5, 0.5,
-3.980564, -1, -6.876347, 1, 1.5, 0.5, 0.5,
-3.980564, -1, -6.876347, 0, 1.5, 0.5, 0.5,
-3.980564, 0, -6.876347, 0, -0.5, 0.5, 0.5,
-3.980564, 0, -6.876347, 1, -0.5, 0.5, 0.5,
-3.980564, 0, -6.876347, 1, 1.5, 0.5, 0.5,
-3.980564, 0, -6.876347, 0, 1.5, 0.5, 0.5,
-3.980564, 1, -6.876347, 0, -0.5, 0.5, 0.5,
-3.980564, 1, -6.876347, 1, -0.5, 0.5, 0.5,
-3.980564, 1, -6.876347, 1, 1.5, 0.5, 0.5,
-3.980564, 1, -6.876347, 0, 1.5, 0.5, 0.5,
-3.980564, 2, -6.876347, 0, -0.5, 0.5, 0.5,
-3.980564, 2, -6.876347, 1, -0.5, 0.5, 0.5,
-3.980564, 2, -6.876347, 1, 1.5, 0.5, 0.5,
-3.980564, 2, -6.876347, 0, 1.5, 0.5, 0.5,
-3.980564, 3, -6.876347, 0, -0.5, 0.5, 0.5,
-3.980564, 3, -6.876347, 1, -0.5, 0.5, 0.5,
-3.980564, 3, -6.876347, 1, 1.5, 0.5, 0.5,
-3.980564, 3, -6.876347, 0, 1.5, 0.5, 0.5
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
-3.504766, -3.074495, -4,
-3.504766, -3.074495, 6,
-3.504766, -3.074495, -4,
-3.663365, -3.24713, -4,
-3.504766, -3.074495, -2,
-3.663365, -3.24713, -2,
-3.504766, -3.074495, 0,
-3.663365, -3.24713, 0,
-3.504766, -3.074495, 2,
-3.663365, -3.24713, 2,
-3.504766, -3.074495, 4,
-3.663365, -3.24713, 4,
-3.504766, -3.074495, 6,
-3.663365, -3.24713, 6
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
-3.980564, -3.592399, -4, 0, -0.5, 0.5, 0.5,
-3.980564, -3.592399, -4, 1, -0.5, 0.5, 0.5,
-3.980564, -3.592399, -4, 1, 1.5, 0.5, 0.5,
-3.980564, -3.592399, -4, 0, 1.5, 0.5, 0.5,
-3.980564, -3.592399, -2, 0, -0.5, 0.5, 0.5,
-3.980564, -3.592399, -2, 1, -0.5, 0.5, 0.5,
-3.980564, -3.592399, -2, 1, 1.5, 0.5, 0.5,
-3.980564, -3.592399, -2, 0, 1.5, 0.5, 0.5,
-3.980564, -3.592399, 0, 0, -0.5, 0.5, 0.5,
-3.980564, -3.592399, 0, 1, -0.5, 0.5, 0.5,
-3.980564, -3.592399, 0, 1, 1.5, 0.5, 0.5,
-3.980564, -3.592399, 0, 0, 1.5, 0.5, 0.5,
-3.980564, -3.592399, 2, 0, -0.5, 0.5, 0.5,
-3.980564, -3.592399, 2, 1, -0.5, 0.5, 0.5,
-3.980564, -3.592399, 2, 1, 1.5, 0.5, 0.5,
-3.980564, -3.592399, 2, 0, 1.5, 0.5, 0.5,
-3.980564, -3.592399, 4, 0, -0.5, 0.5, 0.5,
-3.980564, -3.592399, 4, 1, -0.5, 0.5, 0.5,
-3.980564, -3.592399, 4, 1, 1.5, 0.5, 0.5,
-3.980564, -3.592399, 4, 0, 1.5, 0.5, 0.5,
-3.980564, -3.592399, 6, 0, -0.5, 0.5, 0.5,
-3.980564, -3.592399, 6, 1, -0.5, 0.5, 0.5,
-3.980564, -3.592399, 6, 1, 1.5, 0.5, 0.5,
-3.980564, -3.592399, 6, 0, 1.5, 0.5, 0.5
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
-3.504766, -3.074495, -5.965509,
-3.504766, 3.830897, -5.965509,
-3.504766, -3.074495, 6.178981,
-3.504766, 3.830897, 6.178981,
-3.504766, -3.074495, -5.965509,
-3.504766, -3.074495, 6.178981,
-3.504766, 3.830897, -5.965509,
-3.504766, 3.830897, 6.178981,
-3.504766, -3.074495, -5.965509,
2.839217, -3.074495, -5.965509,
-3.504766, -3.074495, 6.178981,
2.839217, -3.074495, 6.178981,
-3.504766, 3.830897, -5.965509,
2.839217, 3.830897, -5.965509,
-3.504766, 3.830897, 6.178981,
2.839217, 3.830897, 6.178981,
2.839217, -3.074495, -5.965509,
2.839217, 3.830897, -5.965509,
2.839217, -3.074495, 6.178981,
2.839217, 3.830897, 6.178981,
2.839217, -3.074495, -5.965509,
2.839217, -3.074495, 6.178981,
2.839217, 3.830897, -5.965509,
2.839217, 3.830897, 6.178981
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
var radius = 8.193065;
var distance = 36.45187;
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
mvMatrix.translate( 0.3327743, -0.3782011, -0.1067359 );
mvMatrix.scale( 1.396363, 1.282838, 0.7294256 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.45187);
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
triforine<-read.table("triforine.xyz")
```

```
## Error in read.table("triforine.xyz"): no lines available in input
```

```r
x<-triforine$V2
```

```
## Error in eval(expr, envir, enclos): object 'triforine' not found
```

```r
y<-triforine$V3
```

```
## Error in eval(expr, envir, enclos): object 'triforine' not found
```

```r
z<-triforine$V4
```

```
## Error in eval(expr, envir, enclos): object 'triforine' not found
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
-3.412377, -0.2805056, -3.456054, 0, 0, 1, 1, 1,
-3.195342, 0.955283, -1.06349, 1, 0, 0, 1, 1,
-2.912015, 0.7736448, -1.49852, 1, 0, 0, 1, 1,
-2.887783, -0.1136013, -0.1024629, 1, 0, 0, 1, 1,
-2.849442, 0.2411053, -2.205831, 1, 0, 0, 1, 1,
-2.622429, -1.440595, -1.593909, 1, 0, 0, 1, 1,
-2.577265, -1.820006, -2.152378, 0, 0, 0, 1, 1,
-2.5747, -0.5758903, -2.384724, 0, 0, 0, 1, 1,
-2.565106, -0.07511562, 1.572282, 0, 0, 0, 1, 1,
-2.372355, -1.086721, -2.739374, 0, 0, 0, 1, 1,
-2.364817, 0.1162338, -1.002223, 0, 0, 0, 1, 1,
-2.347724, -1.215271, -3.520537, 0, 0, 0, 1, 1,
-2.327941, -0.3762227, -2.338316, 0, 0, 0, 1, 1,
-2.261605, 1.234481, -1.773988, 1, 1, 1, 1, 1,
-2.17934, -0.6766407, -0.9605286, 1, 1, 1, 1, 1,
-2.140899, -1.810755, -3.436938, 1, 1, 1, 1, 1,
-2.110664, -0.6012791, -3.993642, 1, 1, 1, 1, 1,
-2.097193, -0.3920326, -0.9042285, 1, 1, 1, 1, 1,
-2.085865, -0.07934929, -2.442626, 1, 1, 1, 1, 1,
-2.067457, 0.7915978, -1.364733, 1, 1, 1, 1, 1,
-2.0458, -2.055318, -3.363802, 1, 1, 1, 1, 1,
-2.044789, -0.481019, -0.7910026, 1, 1, 1, 1, 1,
-2.044404, -0.2442319, -2.312913, 1, 1, 1, 1, 1,
-2.041506, 0.1960724, -0.1132826, 1, 1, 1, 1, 1,
-2.034033, 0.320348, -1.491208, 1, 1, 1, 1, 1,
-2.027367, 1.004855, -0.5941194, 1, 1, 1, 1, 1,
-2.024281, 1.242448, -1.622435, 1, 1, 1, 1, 1,
-2.022977, 0.1099921, 0.06782997, 1, 1, 1, 1, 1,
-2.011881, 1.27679, -1.200938, 0, 0, 1, 1, 1,
-2.0111, -0.1493551, -1.723472, 1, 0, 0, 1, 1,
-2.000706, 0.5639761, -1.374877, 1, 0, 0, 1, 1,
-1.985591, 1.398601, -0.5091828, 1, 0, 0, 1, 1,
-1.937964, -0.6735882, -0.2503838, 1, 0, 0, 1, 1,
-1.905204, -0.5390735, -2.479182, 1, 0, 0, 1, 1,
-1.893334, 0.1566479, -3.941034, 0, 0, 0, 1, 1,
-1.882838, 0.9624372, -1.940464, 0, 0, 0, 1, 1,
-1.880764, -0.2608095, -0.8531, 0, 0, 0, 1, 1,
-1.877586, 0.5855005, -2.045879, 0, 0, 0, 1, 1,
-1.872913, 0.1025143, -1.691136, 0, 0, 0, 1, 1,
-1.866836, 1.017941, 0.1557432, 0, 0, 0, 1, 1,
-1.852668, -0.3280408, -1.315405, 0, 0, 0, 1, 1,
-1.833862, -1.385487, -2.541238, 1, 1, 1, 1, 1,
-1.806269, -1.442217, -3.058521, 1, 1, 1, 1, 1,
-1.781628, -0.07526251, -1.770226, 1, 1, 1, 1, 1,
-1.775816, -1.812167, -2.781353, 1, 1, 1, 1, 1,
-1.774166, 1.805046, -0.8653353, 1, 1, 1, 1, 1,
-1.773153, 0.7471259, -1.853105, 1, 1, 1, 1, 1,
-1.758744, -0.5364169, -0.8912618, 1, 1, 1, 1, 1,
-1.75326, -1.400311, -1.47398, 1, 1, 1, 1, 1,
-1.746086, 0.1847803, -2.797328, 1, 1, 1, 1, 1,
-1.745437, 0.2720052, -1.467493, 1, 1, 1, 1, 1,
-1.739299, 0.4153346, -1.289837, 1, 1, 1, 1, 1,
-1.717499, 0.7722222, 0.06444338, 1, 1, 1, 1, 1,
-1.702482, 0.8260433, -1.396557, 1, 1, 1, 1, 1,
-1.69969, 2.538513, -1.750322, 1, 1, 1, 1, 1,
-1.696516, -0.09803607, -3.126227, 1, 1, 1, 1, 1,
-1.691051, -0.6739557, -3.322675, 0, 0, 1, 1, 1,
-1.689288, -1.345309, -2.794437, 1, 0, 0, 1, 1,
-1.686278, 0.6557525, 0.1296398, 1, 0, 0, 1, 1,
-1.685665, -0.3025209, -1.434227, 1, 0, 0, 1, 1,
-1.678918, -1.491302, -3.186853, 1, 0, 0, 1, 1,
-1.662576, -1.625999, -2.442796, 1, 0, 0, 1, 1,
-1.66178, 0.1512374, -0.5936707, 0, 0, 0, 1, 1,
-1.65196, 1.565829, -0.6630498, 0, 0, 0, 1, 1,
-1.646735, -0.4764546, -4.203253, 0, 0, 0, 1, 1,
-1.636147, -1.263637, -1.42626, 0, 0, 0, 1, 1,
-1.634426, -0.8272042, -4.056432, 0, 0, 0, 1, 1,
-1.600094, 0.7430803, -2.245941, 0, 0, 0, 1, 1,
-1.59631, -1.222675, -2.84697, 0, 0, 0, 1, 1,
-1.572093, -0.8313883, -1.569407, 1, 1, 1, 1, 1,
-1.568953, 0.7403136, -0.02447941, 1, 1, 1, 1, 1,
-1.564794, -0.6308264, -1.811592, 1, 1, 1, 1, 1,
-1.564242, -0.6282731, -1.977971, 1, 1, 1, 1, 1,
-1.557964, 1.107462, -1.532164, 1, 1, 1, 1, 1,
-1.55062, 0.9251388, 0.4201154, 1, 1, 1, 1, 1,
-1.550022, -0.6605483, -0.5712652, 1, 1, 1, 1, 1,
-1.539353, 0.7889544, -0.8016122, 1, 1, 1, 1, 1,
-1.533099, 0.3763843, -1.832765, 1, 1, 1, 1, 1,
-1.528198, -0.9921171, -2.817493, 1, 1, 1, 1, 1,
-1.506157, -1.914852, -3.483595, 1, 1, 1, 1, 1,
-1.489518, 0.02388872, -0.3621705, 1, 1, 1, 1, 1,
-1.473821, 0.6583776, -1.549198, 1, 1, 1, 1, 1,
-1.457011, -0.2522317, -1.482344, 1, 1, 1, 1, 1,
-1.445522, 0.8568914, -2.197556, 1, 1, 1, 1, 1,
-1.443491, 0.3583447, -1.691363, 0, 0, 1, 1, 1,
-1.443029, -1.574745, -1.689584, 1, 0, 0, 1, 1,
-1.440592, -0.3715579, -1.617705, 1, 0, 0, 1, 1,
-1.439132, 1.930999, -0.843184, 1, 0, 0, 1, 1,
-1.437767, -1.045121, -1.617351, 1, 0, 0, 1, 1,
-1.435437, -0.641368, -3.14594, 1, 0, 0, 1, 1,
-1.427227, -0.1303592, -1.595798, 0, 0, 0, 1, 1,
-1.424034, 0.2855954, 0.03978888, 0, 0, 0, 1, 1,
-1.420598, -0.3256818, -1.675243, 0, 0, 0, 1, 1,
-1.41036, -0.5682953, -2.284565, 0, 0, 0, 1, 1,
-1.399722, -0.6108549, -2.739801, 0, 0, 0, 1, 1,
-1.395902, 0.2359625, -2.519754, 0, 0, 0, 1, 1,
-1.377862, 1.409907, -0.9248539, 0, 0, 0, 1, 1,
-1.371358, 0.3271554, -1.104123, 1, 1, 1, 1, 1,
-1.364552, 0.9413301, -0.6113555, 1, 1, 1, 1, 1,
-1.363726, 0.3498486, 0.2261533, 1, 1, 1, 1, 1,
-1.358654, 0.6381533, -0.8515511, 1, 1, 1, 1, 1,
-1.344537, 0.2704372, -0.1093933, 1, 1, 1, 1, 1,
-1.341466, -0.1602782, -1.862601, 1, 1, 1, 1, 1,
-1.333084, 1.670777, 0.2381588, 1, 1, 1, 1, 1,
-1.331244, 0.8712727, -2.350811, 1, 1, 1, 1, 1,
-1.322221, -0.0281797, -0.8905341, 1, 1, 1, 1, 1,
-1.313336, -0.006088068, -1.456864, 1, 1, 1, 1, 1,
-1.313175, 0.3212623, -2.025068, 1, 1, 1, 1, 1,
-1.305039, -1.01811, -2.838603, 1, 1, 1, 1, 1,
-1.301347, -0.8199214, -0.6941221, 1, 1, 1, 1, 1,
-1.298105, 1.525779, -2.076198, 1, 1, 1, 1, 1,
-1.29419, 1.101889, -0.6430468, 1, 1, 1, 1, 1,
-1.292616, 0.7638962, -1.18738, 0, 0, 1, 1, 1,
-1.284432, 0.982272, -1.616391, 1, 0, 0, 1, 1,
-1.282637, 0.6177098, -0.2606964, 1, 0, 0, 1, 1,
-1.274358, 0.2863264, -0.07978667, 1, 0, 0, 1, 1,
-1.270035, 1.420742, -2.355308, 1, 0, 0, 1, 1,
-1.265748, -0.5491179, -3.527565, 1, 0, 0, 1, 1,
-1.265169, -1.228634, -2.199697, 0, 0, 0, 1, 1,
-1.264798, 2.291513, 1.005627, 0, 0, 0, 1, 1,
-1.258562, -0.3475322, -2.664612, 0, 0, 0, 1, 1,
-1.249124, -1.898727, -3.763149, 0, 0, 0, 1, 1,
-1.247699, -1.243904, -2.951614, 0, 0, 0, 1, 1,
-1.238743, 1.429941, -2.325624, 0, 0, 0, 1, 1,
-1.237175, 1.850474, -0.3091572, 0, 0, 0, 1, 1,
-1.235022, 1.266012, -0.3710856, 1, 1, 1, 1, 1,
-1.23297, 0.440701, -0.3327664, 1, 1, 1, 1, 1,
-1.223507, -0.3741691, -2.034931, 1, 1, 1, 1, 1,
-1.213563, -1.105343, -1.932577, 1, 1, 1, 1, 1,
-1.20903, -0.6997128, -2.141197, 1, 1, 1, 1, 1,
-1.196309, -0.8062153, -0.6665531, 1, 1, 1, 1, 1,
-1.191925, 0.9307318, -1.81623, 1, 1, 1, 1, 1,
-1.191689, 0.08994325, -1.359882, 1, 1, 1, 1, 1,
-1.190937, -0.3045081, -1.836146, 1, 1, 1, 1, 1,
-1.187963, 0.6097261, -1.023202, 1, 1, 1, 1, 1,
-1.183751, -0.4524866, -1.786391, 1, 1, 1, 1, 1,
-1.180197, 0.6675472, -0.6185195, 1, 1, 1, 1, 1,
-1.180039, 0.5747417, -1.029792, 1, 1, 1, 1, 1,
-1.175452, -1.324014, -3.938603, 1, 1, 1, 1, 1,
-1.17181, 0.1138274, -1.599327, 1, 1, 1, 1, 1,
-1.164458, -1.075447, -1.960512, 0, 0, 1, 1, 1,
-1.160339, -1.783274, -4.480215, 1, 0, 0, 1, 1,
-1.158926, 0.04614026, -1.62012, 1, 0, 0, 1, 1,
-1.157995, -0.1386697, -2.585715, 1, 0, 0, 1, 1,
-1.156685, 0.9187161, -2.684354, 1, 0, 0, 1, 1,
-1.154606, -1.127914, -0.9452768, 1, 0, 0, 1, 1,
-1.152781, 0.6760866, -3.400047, 0, 0, 0, 1, 1,
-1.152189, 0.3175791, 0.4047125, 0, 0, 0, 1, 1,
-1.143264, -1.227751, -3.725869, 0, 0, 0, 1, 1,
-1.140683, 0.2848993, 0.4588661, 0, 0, 0, 1, 1,
-1.139868, 0.9047321, -2.056229, 0, 0, 0, 1, 1,
-1.130116, -0.1292518, -3.416658, 0, 0, 0, 1, 1,
-1.129342, 0.9838691, -0.8738732, 0, 0, 0, 1, 1,
-1.126087, 1.052515, 0.03651538, 1, 1, 1, 1, 1,
-1.12527, -0.7861921, -2.267722, 1, 1, 1, 1, 1,
-1.121285, 0.9235917, 0.3500245, 1, 1, 1, 1, 1,
-1.114527, 1.611181, -1.887028, 1, 1, 1, 1, 1,
-1.101562, 0.3621981, 0.3664815, 1, 1, 1, 1, 1,
-1.089478, -0.585808, -3.042847, 1, 1, 1, 1, 1,
-1.081315, 0.1773129, -1.486356, 1, 1, 1, 1, 1,
-1.076374, -0.5623411, -2.181462, 1, 1, 1, 1, 1,
-1.074025, 0.9511511, 0.0600979, 1, 1, 1, 1, 1,
-1.073701, -0.7290759, -1.903831, 1, 1, 1, 1, 1,
-1.073616, 0.7199808, -1.771527, 1, 1, 1, 1, 1,
-1.071531, -0.6219549, -1.992106, 1, 1, 1, 1, 1,
-1.064932, 0.4780355, 0.1528397, 1, 1, 1, 1, 1,
-1.063962, 0.5167975, -1.390557, 1, 1, 1, 1, 1,
-1.063823, -0.5004228, -3.13493, 1, 1, 1, 1, 1,
-1.049757, 1.851276, -0.8128643, 0, 0, 1, 1, 1,
-1.048272, -1.214842, -2.437356, 1, 0, 0, 1, 1,
-1.046008, 1.304311, -0.2606796, 1, 0, 0, 1, 1,
-1.045933, -1.223252, -3.729698, 1, 0, 0, 1, 1,
-1.037224, 0.655505, -1.957062, 1, 0, 0, 1, 1,
-1.036718, -1.018493, -1.179607, 1, 0, 0, 1, 1,
-1.033225, 0.03064498, -1.359204, 0, 0, 0, 1, 1,
-1.029348, -1.412577, -3.408847, 0, 0, 0, 1, 1,
-1.024017, 0.2903118, -1.413208, 0, 0, 0, 1, 1,
-1.01862, -0.7396512, -1.243585, 0, 0, 0, 1, 1,
-1.016395, -1.857667, -1.003651, 0, 0, 0, 1, 1,
-1.015936, -0.6996846, -2.837988, 0, 0, 0, 1, 1,
-1.012645, -1.224794, -0.7156205, 0, 0, 0, 1, 1,
-1.011996, 0.6353291, -2.004063, 1, 1, 1, 1, 1,
-1.007863, 0.03699568, -2.674873, 1, 1, 1, 1, 1,
-1.001837, 1.909785, -1.206596, 1, 1, 1, 1, 1,
-0.9927616, 0.6932474, -0.9094155, 1, 1, 1, 1, 1,
-0.9876924, -0.2567742, -1.100834, 1, 1, 1, 1, 1,
-0.9840442, 0.1646719, -3.140759, 1, 1, 1, 1, 1,
-0.9740544, -0.2203625, -2.172776, 1, 1, 1, 1, 1,
-0.9709716, -0.2618804, -1.288433, 1, 1, 1, 1, 1,
-0.9667042, -0.3473382, -1.854372, 1, 1, 1, 1, 1,
-0.9605052, -1.641535, -2.662917, 1, 1, 1, 1, 1,
-0.9592021, -0.216429, -3.243781, 1, 1, 1, 1, 1,
-0.9586913, 0.1271093, -0.5465394, 1, 1, 1, 1, 1,
-0.950987, 1.664484, -0.02819759, 1, 1, 1, 1, 1,
-0.9448301, 0.1697309, -0.9031068, 1, 1, 1, 1, 1,
-0.9407095, -0.1803838, -2.005131, 1, 1, 1, 1, 1,
-0.9391384, 0.1743769, -0.3111544, 0, 0, 1, 1, 1,
-0.9364632, -0.5991889, -4.670565, 1, 0, 0, 1, 1,
-0.9354916, 0.9039686, -0.7921642, 1, 0, 0, 1, 1,
-0.9215593, 0.2500169, -1.018476, 1, 0, 0, 1, 1,
-0.9175979, 1.512663, -2.591328, 1, 0, 0, 1, 1,
-0.9167877, -1.055684, -2.201087, 1, 0, 0, 1, 1,
-0.9167076, -1.037608, -1.837046, 0, 0, 0, 1, 1,
-0.913231, 1.317321, -1.450457, 0, 0, 0, 1, 1,
-0.9101538, 0.1503288, -0.2680479, 0, 0, 0, 1, 1,
-0.9092495, 1.561526, -0.2802426, 0, 0, 0, 1, 1,
-0.9073588, -0.5193372, -1.240909, 0, 0, 0, 1, 1,
-0.9040385, 0.002188364, -2.955674, 0, 0, 0, 1, 1,
-0.8978969, -0.1221676, -1.202305, 0, 0, 0, 1, 1,
-0.8943775, 0.0338339, -2.645793, 1, 1, 1, 1, 1,
-0.8926541, 1.070994, -1.028553, 1, 1, 1, 1, 1,
-0.8885497, -0.7385599, -3.090285, 1, 1, 1, 1, 1,
-0.8858902, -0.7708682, -1.113558, 1, 1, 1, 1, 1,
-0.8852421, -0.03667816, -0.8049711, 1, 1, 1, 1, 1,
-0.8789067, 2.36966, -1.089225, 1, 1, 1, 1, 1,
-0.8784347, 1.174716, -0.2178576, 1, 1, 1, 1, 1,
-0.8784206, 0.3268572, -2.154347, 1, 1, 1, 1, 1,
-0.8703087, 0.1547822, -1.813174, 1, 1, 1, 1, 1,
-0.8662868, 2.382084, 0.0611058, 1, 1, 1, 1, 1,
-0.8604531, 0.355623, -0.482036, 1, 1, 1, 1, 1,
-0.8591817, 1.818165, -0.08233805, 1, 1, 1, 1, 1,
-0.857556, 0.2858007, -3.279013, 1, 1, 1, 1, 1,
-0.8552267, 2.369169, -0.9827917, 1, 1, 1, 1, 1,
-0.8535468, -0.05714736, -0.7882352, 1, 1, 1, 1, 1,
-0.8533325, 1.355323, -1.370975, 0, 0, 1, 1, 1,
-0.8487092, -0.3590534, -2.775132, 1, 0, 0, 1, 1,
-0.8372374, -0.3586612, -1.0288, 1, 0, 0, 1, 1,
-0.8320206, 0.5652768, -1.954543, 1, 0, 0, 1, 1,
-0.8279604, -0.1501453, -2.166078, 1, 0, 0, 1, 1,
-0.8277765, -2.192338, -4.136751, 1, 0, 0, 1, 1,
-0.8276891, 0.04189949, -1.616022, 0, 0, 0, 1, 1,
-0.8263932, -0.249992, -1.552141, 0, 0, 0, 1, 1,
-0.8217453, 1.234818, -0.5715166, 0, 0, 0, 1, 1,
-0.8186657, 0.1212111, -3.693078, 0, 0, 0, 1, 1,
-0.8092523, 0.9839433, -2.331683, 0, 0, 0, 1, 1,
-0.8077969, -0.5570184, -1.000745, 0, 0, 0, 1, 1,
-0.8013726, -0.2274789, -1.242743, 0, 0, 0, 1, 1,
-0.7941067, -1.545763, -3.570296, 1, 1, 1, 1, 1,
-0.7872549, 1.252551, -1.13817, 1, 1, 1, 1, 1,
-0.7857471, -0.7496616, -4.036396, 1, 1, 1, 1, 1,
-0.7851909, -0.806847, -4.116757, 1, 1, 1, 1, 1,
-0.7822134, -2.167647, -1.857263, 1, 1, 1, 1, 1,
-0.7688826, -1.953955, 0.3818435, 1, 1, 1, 1, 1,
-0.7667263, -1.761219, -3.090838, 1, 1, 1, 1, 1,
-0.7603125, 0.1417134, -2.176502, 1, 1, 1, 1, 1,
-0.7539002, 0.0881198, -1.607133, 1, 1, 1, 1, 1,
-0.7444786, 0.08672761, -2.196756, 1, 1, 1, 1, 1,
-0.7436019, 1.159162, 1.484969, 1, 1, 1, 1, 1,
-0.7421435, -1.039634, -2.299216, 1, 1, 1, 1, 1,
-0.7419631, 2.413085, -0.1125296, 1, 1, 1, 1, 1,
-0.7406825, -0.2705293, -2.263235, 1, 1, 1, 1, 1,
-0.7394203, -1.514808, -2.606786, 1, 1, 1, 1, 1,
-0.7393615, 0.4323667, -0.4623004, 0, 0, 1, 1, 1,
-0.7365285, 0.5284037, 0.9356514, 1, 0, 0, 1, 1,
-0.7269822, 1.018358, -0.2994657, 1, 0, 0, 1, 1,
-0.7230383, -0.9805697, -2.746464, 1, 0, 0, 1, 1,
-0.719417, -0.04005063, -0.06009591, 1, 0, 0, 1, 1,
-0.713375, 1.765172, -1.19037, 1, 0, 0, 1, 1,
-0.7122778, -1.480975, -3.678309, 0, 0, 0, 1, 1,
-0.7101183, -0.07135458, -3.240916, 0, 0, 0, 1, 1,
-0.7090045, -0.3315863, -2.842739, 0, 0, 0, 1, 1,
-0.7063198, -0.5786992, -1.69074, 0, 0, 0, 1, 1,
-0.7061283, 1.443625, -1.518982, 0, 0, 0, 1, 1,
-0.7049965, -1.616119, -2.17585, 0, 0, 0, 1, 1,
-0.7013172, -1.06916, -1.609166, 0, 0, 0, 1, 1,
-0.6977963, 0.3521357, -2.088241, 1, 1, 1, 1, 1,
-0.6953945, 1.532766, -1.655244, 1, 1, 1, 1, 1,
-0.6933996, 0.7909506, 0.7553424, 1, 1, 1, 1, 1,
-0.6928999, 0.170013, -3.050407, 1, 1, 1, 1, 1,
-0.6927741, -0.1963353, -0.3427272, 1, 1, 1, 1, 1,
-0.6893355, 0.03437402, -2.623356, 1, 1, 1, 1, 1,
-0.6887081, -0.1874116, -2.233021, 1, 1, 1, 1, 1,
-0.6863706, -0.2100509, 0.06038, 1, 1, 1, 1, 1,
-0.6857097, 0.9532951, -0.01659918, 1, 1, 1, 1, 1,
-0.6797312, 0.7905343, -1.105837, 1, 1, 1, 1, 1,
-0.6770836, -2.21251, -2.495217, 1, 1, 1, 1, 1,
-0.6712828, -0.2976319, -2.471872, 1, 1, 1, 1, 1,
-0.6695197, 0.6618677, -2.245357, 1, 1, 1, 1, 1,
-0.6673676, -0.161846, -0.9663025, 1, 1, 1, 1, 1,
-0.6648855, 1.512323, -0.01094613, 1, 1, 1, 1, 1,
-0.6645355, -0.4654602, -3.971453, 0, 0, 1, 1, 1,
-0.6642064, 0.1516587, -2.315336, 1, 0, 0, 1, 1,
-0.6616567, 1.341367, 0.6539504, 1, 0, 0, 1, 1,
-0.6594386, 0.5693793, -0.6503325, 1, 0, 0, 1, 1,
-0.646177, 0.08905512, -1.546577, 1, 0, 0, 1, 1,
-0.6429437, -1.452026, -3.0581, 1, 0, 0, 1, 1,
-0.6425226, 1.132647, 0.6993213, 0, 0, 0, 1, 1,
-0.6382915, 0.1406207, -0.6409968, 0, 0, 0, 1, 1,
-0.6372364, 1.424632, -1.39791, 0, 0, 0, 1, 1,
-0.6326011, -0.7397133, -1.264876, 0, 0, 0, 1, 1,
-0.631405, -0.1724451, -0.8793728, 0, 0, 0, 1, 1,
-0.627357, -0.09257057, -2.274826, 0, 0, 0, 1, 1,
-0.6271296, 0.535668, -0.4939519, 0, 0, 0, 1, 1,
-0.6271248, 0.5528307, -0.7029691, 1, 1, 1, 1, 1,
-0.6266606, -2.663677, -3.305834, 1, 1, 1, 1, 1,
-0.6264989, 0.318812, -2.295047, 1, 1, 1, 1, 1,
-0.6186068, 0.3700416, -0.07709116, 1, 1, 1, 1, 1,
-0.6160083, -0.24932, -0.7695309, 1, 1, 1, 1, 1,
-0.6145248, 1.14, -1.148223, 1, 1, 1, 1, 1,
-0.6140764, 0.6721758, -1.309289, 1, 1, 1, 1, 1,
-0.613646, 0.3590486, -3.155614, 1, 1, 1, 1, 1,
-0.6116815, 0.5182596, -0.1872074, 1, 1, 1, 1, 1,
-0.6065431, 0.1521961, -1.687843, 1, 1, 1, 1, 1,
-0.5928456, -0.1827907, -0.4059324, 1, 1, 1, 1, 1,
-0.59248, 0.1960277, -2.258972, 1, 1, 1, 1, 1,
-0.5825425, -0.1830397, -0.4297092, 1, 1, 1, 1, 1,
-0.5757697, 2.141212, -0.1167159, 1, 1, 1, 1, 1,
-0.5731412, 0.7562603, -2.399984, 1, 1, 1, 1, 1,
-0.5632289, 0.1353541, -1.641141, 0, 0, 1, 1, 1,
-0.5525615, -0.05626112, -1.889512, 1, 0, 0, 1, 1,
-0.5508065, 0.01967363, -1.106826, 1, 0, 0, 1, 1,
-0.5503612, -1.564089, -2.698439, 1, 0, 0, 1, 1,
-0.5497399, -0.9727463, -2.101604, 1, 0, 0, 1, 1,
-0.5463974, 1.560074, 0.7557495, 1, 0, 0, 1, 1,
-0.5460979, 0.2402529, -1.806789, 0, 0, 0, 1, 1,
-0.5447794, 1.61376, -0.3935349, 0, 0, 0, 1, 1,
-0.5427681, -1.362527, -3.888075, 0, 0, 0, 1, 1,
-0.5256466, -1.482864, -3.042539, 0, 0, 0, 1, 1,
-0.5202129, 0.3936322, -1.836636, 0, 0, 0, 1, 1,
-0.5151269, 0.8654999, -1.445524, 0, 0, 0, 1, 1,
-0.5138124, -1.03551, -3.581873, 0, 0, 0, 1, 1,
-0.5118137, 0.4818427, 0.2674805, 1, 1, 1, 1, 1,
-0.5038713, 0.6341809, -0.8229975, 1, 1, 1, 1, 1,
-0.4953966, -1.348815, -4.275127, 1, 1, 1, 1, 1,
-0.4948778, 1.696352, -0.4902989, 1, 1, 1, 1, 1,
-0.4916256, -1.098947, -2.849961, 1, 1, 1, 1, 1,
-0.4888403, 0.1664752, -1.885783, 1, 1, 1, 1, 1,
-0.4855287, -0.7366641, -4.413715, 1, 1, 1, 1, 1,
-0.4787543, 0.03943599, -1.308178, 1, 1, 1, 1, 1,
-0.4745308, -0.1375077, -0.3328626, 1, 1, 1, 1, 1,
-0.4723638, -0.7043931, -1.774892, 1, 1, 1, 1, 1,
-0.4721934, 0.5216799, -1.161986, 1, 1, 1, 1, 1,
-0.469117, -0.09551472, -2.181997, 1, 1, 1, 1, 1,
-0.4687231, 1.429656, 0.2051561, 1, 1, 1, 1, 1,
-0.4679622, -0.9967908, -1.401394, 1, 1, 1, 1, 1,
-0.4627298, -0.2613226, -1.459584, 1, 1, 1, 1, 1,
-0.4598124, 0.2802657, 0.1790399, 0, 0, 1, 1, 1,
-0.4591776, -1.22625, -3.259399, 1, 0, 0, 1, 1,
-0.4564101, -2.973931, -3.960677, 1, 0, 0, 1, 1,
-0.4542808, 0.9968481, 0.1339798, 1, 0, 0, 1, 1,
-0.4527999, 0.1841701, -0.7648956, 1, 0, 0, 1, 1,
-0.4516398, -0.7449344, -2.093304, 1, 0, 0, 1, 1,
-0.4501401, 1.098174, -1.025917, 0, 0, 0, 1, 1,
-0.4467257, -0.7552792, -1.066778, 0, 0, 0, 1, 1,
-0.4413846, -0.7743713, -1.442441, 0, 0, 0, 1, 1,
-0.437514, 0.3060576, -0.4954999, 0, 0, 0, 1, 1,
-0.4309084, -0.4509513, -2.89729, 0, 0, 0, 1, 1,
-0.4270896, 0.2188815, -0.6586646, 0, 0, 0, 1, 1,
-0.4267748, 0.4385975, 0.7846405, 0, 0, 0, 1, 1,
-0.421747, -1.491125, -3.554986, 1, 1, 1, 1, 1,
-0.4196598, 0.06855203, -1.192861, 1, 1, 1, 1, 1,
-0.4173243, 1.688715, 1.507784, 1, 1, 1, 1, 1,
-0.4162458, 0.1601695, -2.908237, 1, 1, 1, 1, 1,
-0.4145336, 0.07551774, -1.554757, 1, 1, 1, 1, 1,
-0.4118468, -1.005277, -2.97814, 1, 1, 1, 1, 1,
-0.4109013, -1.488615, -3.876149, 1, 1, 1, 1, 1,
-0.4108202, -1.30801, -2.002791, 1, 1, 1, 1, 1,
-0.4098465, 0.005870445, 0.4279269, 1, 1, 1, 1, 1,
-0.4078233, 0.9379114, 1.329046, 1, 1, 1, 1, 1,
-0.403602, -0.5156677, -3.204986, 1, 1, 1, 1, 1,
-0.4004818, -1.206168, -1.711683, 1, 1, 1, 1, 1,
-0.3961746, 0.182806, -0.09436096, 1, 1, 1, 1, 1,
-0.3956132, -1.443646, -2.951651, 1, 1, 1, 1, 1,
-0.3920113, 1.197943, -1.270046, 1, 1, 1, 1, 1,
-0.3890863, -1.360294, -3.940994, 0, 0, 1, 1, 1,
-0.3846763, 1.487543, -0.5711445, 1, 0, 0, 1, 1,
-0.3836075, 1.663346, 0.2188187, 1, 0, 0, 1, 1,
-0.381619, 0.1360587, -0.4048848, 1, 0, 0, 1, 1,
-0.3790819, -0.1075376, -1.641286, 1, 0, 0, 1, 1,
-0.3787889, -0.4093929, -2.342599, 1, 0, 0, 1, 1,
-0.3730685, 1.076374, -0.0974121, 0, 0, 0, 1, 1,
-0.3712946, 0.09942026, -0.9745502, 0, 0, 0, 1, 1,
-0.3701348, 0.5928486, 0.1043479, 0, 0, 0, 1, 1,
-0.366945, -0.4362408, -3.874336, 0, 0, 0, 1, 1,
-0.3662921, -0.1260932, -0.7360484, 0, 0, 0, 1, 1,
-0.3661472, 0.6627799, 0.07840735, 0, 0, 0, 1, 1,
-0.3661427, -0.8944643, -3.599022, 0, 0, 0, 1, 1,
-0.3613288, -1.604245, -3.896403, 1, 1, 1, 1, 1,
-0.3593961, 1.323741, 0.6170775, 1, 1, 1, 1, 1,
-0.3584449, -0.3833958, -1.586891, 1, 1, 1, 1, 1,
-0.353568, -2.447604, -3.614032, 1, 1, 1, 1, 1,
-0.3525039, 0.8459337, 1.169785, 1, 1, 1, 1, 1,
-0.3514553, 0.01044929, 0.03764481, 1, 1, 1, 1, 1,
-0.3505573, 0.7453599, -0.7578053, 1, 1, 1, 1, 1,
-0.3504549, 1.1324, -0.5757133, 1, 1, 1, 1, 1,
-0.3503308, -0.2548853, -2.022335, 1, 1, 1, 1, 1,
-0.3481045, 0.7234496, -0.4854673, 1, 1, 1, 1, 1,
-0.3480537, 0.07950557, -3.031275, 1, 1, 1, 1, 1,
-0.3479229, -0.7940917, -2.955201, 1, 1, 1, 1, 1,
-0.3398932, 0.03994746, -0.7440602, 1, 1, 1, 1, 1,
-0.3337529, 1.876597, -0.6358531, 1, 1, 1, 1, 1,
-0.3302739, 1.141359, 1.128505, 1, 1, 1, 1, 1,
-0.3301398, -1.193625, -1.691169, 0, 0, 1, 1, 1,
-0.3295333, 0.5671857, -0.7386214, 1, 0, 0, 1, 1,
-0.3285737, -0.817789, -1.121346, 1, 0, 0, 1, 1,
-0.3276685, 0.8183233, -2.138531, 1, 0, 0, 1, 1,
-0.3254149, -0.686665, -1.616882, 1, 0, 0, 1, 1,
-0.3246541, -0.8936152, -5.527972, 1, 0, 0, 1, 1,
-0.322868, -0.8298156, -3.410978, 0, 0, 0, 1, 1,
-0.3214425, 0.1559503, -0.3619135, 0, 0, 0, 1, 1,
-0.3181069, -1.236975, -0.3702357, 0, 0, 0, 1, 1,
-0.3142782, 0.6346052, -0.9420403, 0, 0, 0, 1, 1,
-0.3124932, 0.5606229, -1.881703, 0, 0, 0, 1, 1,
-0.3093602, 0.470643, -0.3423917, 0, 0, 0, 1, 1,
-0.3089065, -0.7266197, -2.48738, 0, 0, 0, 1, 1,
-0.3087758, 0.8789913, 0.3648639, 1, 1, 1, 1, 1,
-0.2983959, -0.8233352, -2.042655, 1, 1, 1, 1, 1,
-0.2964428, 0.0001764562, -0.3575834, 1, 1, 1, 1, 1,
-0.2957533, 0.1788313, -0.8343883, 1, 1, 1, 1, 1,
-0.2944897, -1.236108, -3.826718, 1, 1, 1, 1, 1,
-0.2939084, 0.5824568, -0.06351364, 1, 1, 1, 1, 1,
-0.2927073, -0.9104809, -4.337314, 1, 1, 1, 1, 1,
-0.2913719, -2.050964, -3.607015, 1, 1, 1, 1, 1,
-0.2883125, -0.7495661, -3.181879, 1, 1, 1, 1, 1,
-0.2840638, -1.187043, -2.005738, 1, 1, 1, 1, 1,
-0.2805116, -0.1498879, -2.524348, 1, 1, 1, 1, 1,
-0.2781282, -1.566939, -3.534883, 1, 1, 1, 1, 1,
-0.276656, -0.06360926, -3.545386, 1, 1, 1, 1, 1,
-0.2757902, -0.3640631, -1.953516, 1, 1, 1, 1, 1,
-0.2697665, -0.6040355, -4.495506, 1, 1, 1, 1, 1,
-0.2672746, -0.1678508, -2.540994, 0, 0, 1, 1, 1,
-0.2653076, -1.23508, -4.668211, 1, 0, 0, 1, 1,
-0.2651141, -0.944842, -0.8262439, 1, 0, 0, 1, 1,
-0.2639882, -0.4833252, -4.435486, 1, 0, 0, 1, 1,
-0.2636312, -0.1160847, -1.086383, 1, 0, 0, 1, 1,
-0.262196, 0.3006705, -0.8403857, 1, 0, 0, 1, 1,
-0.2608903, -0.6066551, -2.849219, 0, 0, 0, 1, 1,
-0.2531917, -0.5766318, -3.65978, 0, 0, 0, 1, 1,
-0.251909, -0.1625116, -2.458549, 0, 0, 0, 1, 1,
-0.2497451, 0.5847983, -1.142721, 0, 0, 0, 1, 1,
-0.2468899, 0.7529576, -1.502555, 0, 0, 0, 1, 1,
-0.2346064, -0.9892794, -4.643231, 0, 0, 0, 1, 1,
-0.232848, 2.035559, -1.552079, 0, 0, 0, 1, 1,
-0.231487, -0.8037103, -1.092404, 1, 1, 1, 1, 1,
-0.2298604, -0.02694454, -3.376713, 1, 1, 1, 1, 1,
-0.2254565, -0.020754, -1.604329, 1, 1, 1, 1, 1,
-0.2248856, 1.755507, 0.5818914, 1, 1, 1, 1, 1,
-0.2237176, 0.8515802, -2.439023, 1, 1, 1, 1, 1,
-0.2217769, 0.5641677, -0.9050793, 1, 1, 1, 1, 1,
-0.2136333, -0.7331296, -3.182378, 1, 1, 1, 1, 1,
-0.2121751, 0.0773633, -0.2882058, 1, 1, 1, 1, 1,
-0.2110434, 0.4658668, -0.8103507, 1, 1, 1, 1, 1,
-0.2047888, 0.08215514, -1.635696, 1, 1, 1, 1, 1,
-0.2024468, 0.8379487, 0.3793165, 1, 1, 1, 1, 1,
-0.2023221, -0.4987423, -3.228664, 1, 1, 1, 1, 1,
-0.2012776, 1.12223, -2.117433, 1, 1, 1, 1, 1,
-0.1974122, -0.04177213, -1.025516, 1, 1, 1, 1, 1,
-0.1945964, -0.4633751, -2.034664, 1, 1, 1, 1, 1,
-0.1921825, -0.8999574, -2.845776, 0, 0, 1, 1, 1,
-0.1918223, -0.8274583, -0.5514421, 1, 0, 0, 1, 1,
-0.181922, 1.35466, -0.2071681, 1, 0, 0, 1, 1,
-0.1778471, -0.7061858, -2.680316, 1, 0, 0, 1, 1,
-0.174738, 0.3357404, 0.2140204, 1, 0, 0, 1, 1,
-0.174228, 2.541602, -0.9392647, 1, 0, 0, 1, 1,
-0.1736606, 0.4053513, -0.4832386, 0, 0, 0, 1, 1,
-0.1734616, -0.6430547, -3.914478, 0, 0, 0, 1, 1,
-0.1725577, 0.05048482, -2.339441, 0, 0, 0, 1, 1,
-0.171583, -0.06708955, -0.8606067, 0, 0, 0, 1, 1,
-0.1713387, -1.9443, -2.444356, 0, 0, 0, 1, 1,
-0.1653678, 1.828675, -0.04667491, 0, 0, 0, 1, 1,
-0.1624429, 0.4570897, -1.448023, 0, 0, 0, 1, 1,
-0.1601989, -0.7076529, -2.362894, 1, 1, 1, 1, 1,
-0.1564584, -1.218237, -2.72481, 1, 1, 1, 1, 1,
-0.1563029, 0.08139263, -0.09364329, 1, 1, 1, 1, 1,
-0.1554962, -1.606418, -2.597094, 1, 1, 1, 1, 1,
-0.1548864, 0.4418392, 0.599282, 1, 1, 1, 1, 1,
-0.1516422, -1.18134, -3.120439, 1, 1, 1, 1, 1,
-0.1504703, 0.429921, 0.4521543, 1, 1, 1, 1, 1,
-0.1489156, -0.2598318, -2.958901, 1, 1, 1, 1, 1,
-0.1467825, -0.140158, -0.3293842, 1, 1, 1, 1, 1,
-0.1429194, -0.6186816, -3.131677, 1, 1, 1, 1, 1,
-0.1410444, -0.6918858, -1.977981, 1, 1, 1, 1, 1,
-0.1332383, 0.6749669, -2.148412, 1, 1, 1, 1, 1,
-0.1293339, -0.7711888, -5.788648, 1, 1, 1, 1, 1,
-0.1279555, 0.5049742, 0.9963401, 1, 1, 1, 1, 1,
-0.1274983, 1.075807, 0.2260543, 1, 1, 1, 1, 1,
-0.1269173, 0.3730046, -0.6009013, 0, 0, 1, 1, 1,
-0.1268172, -1.170947, -3.571346, 1, 0, 0, 1, 1,
-0.1245568, -1.013845, -4.257584, 1, 0, 0, 1, 1,
-0.1228515, 1.672866, 1.25906, 1, 0, 0, 1, 1,
-0.1134627, 1.858085, -0.7431344, 1, 0, 0, 1, 1,
-0.1129277, 0.6134654, -0.8141599, 1, 0, 0, 1, 1,
-0.1123244, 1.013914, 0.937116, 0, 0, 0, 1, 1,
-0.1098517, -0.2120203, -1.737281, 0, 0, 0, 1, 1,
-0.1068462, 0.3443513, -0.1875625, 0, 0, 0, 1, 1,
-0.1067173, 0.4120439, 0.3446023, 0, 0, 0, 1, 1,
-0.1036082, 0.7570885, -0.4094017, 0, 0, 0, 1, 1,
-0.09932695, -0.3876946, -2.148933, 0, 0, 0, 1, 1,
-0.091824, -0.2838493, -2.081602, 0, 0, 0, 1, 1,
-0.088749, 0.4235995, -0.08074533, 1, 1, 1, 1, 1,
-0.0833579, 0.9574805, 0.4398146, 1, 1, 1, 1, 1,
-0.0788742, 0.5997917, 1.838905, 1, 1, 1, 1, 1,
-0.07737967, -0.03030833, -5.226882, 1, 1, 1, 1, 1,
-0.07603826, 0.5879385, -0.6422741, 1, 1, 1, 1, 1,
-0.07296018, 0.6173859, -0.3603527, 1, 1, 1, 1, 1,
-0.06981925, -0.8106214, -4.309485, 1, 1, 1, 1, 1,
-0.065492, 0.193225, 0.1353093, 1, 1, 1, 1, 1,
-0.06302421, -2.107303, -4.246242, 1, 1, 1, 1, 1,
-0.06129232, 0.8727987, 0.1220474, 1, 1, 1, 1, 1,
-0.06129061, 0.2306294, 0.3776983, 1, 1, 1, 1, 1,
-0.05868421, 1.645068, -1.937775, 1, 1, 1, 1, 1,
-0.05843264, 1.312311, 0.05971016, 1, 1, 1, 1, 1,
-0.05621078, 0.5069042, -0.3332056, 1, 1, 1, 1, 1,
-0.05617476, -0.218741, -3.162615, 1, 1, 1, 1, 1,
-0.05587792, -1.003198, -2.552267, 0, 0, 1, 1, 1,
-0.05117007, 0.02168546, -2.577348, 1, 0, 0, 1, 1,
-0.05096119, -0.2621752, -3.482635, 1, 0, 0, 1, 1,
-0.0466205, -0.634413, -2.940021, 1, 0, 0, 1, 1,
-0.04389805, 0.4798208, -1.170339, 1, 0, 0, 1, 1,
-0.03904385, 2.035024, -1.178804, 1, 0, 0, 1, 1,
-0.0367209, 2.076867, -1.945599, 0, 0, 0, 1, 1,
-0.03577468, 1.637941, -0.561298, 0, 0, 0, 1, 1,
-0.03507188, 0.7056363, -0.5892908, 0, 0, 0, 1, 1,
-0.03259298, 0.4362949, 1.181296, 0, 0, 0, 1, 1,
-0.03252467, -0.5875809, -2.467746, 0, 0, 0, 1, 1,
-0.02970727, -0.6884187, -2.638836, 0, 0, 0, 1, 1,
-0.02704226, -1.758988, -2.59241, 0, 0, 0, 1, 1,
-0.02465514, -1.372881, -3.048015, 1, 1, 1, 1, 1,
-0.02388129, 0.1379905, -1.237852, 1, 1, 1, 1, 1,
-0.02361527, -1.017849, -4.670352, 1, 1, 1, 1, 1,
-0.02198741, -1.262537, -4.473395, 1, 1, 1, 1, 1,
-0.02125289, -1.480131, -4.924178, 1, 1, 1, 1, 1,
-0.01345991, 0.7456636, 0.8679466, 1, 1, 1, 1, 1,
-0.01266516, -0.7185475, -1.018501, 1, 1, 1, 1, 1,
-0.01060063, 0.5450642, 0.2026717, 1, 1, 1, 1, 1,
-0.01013027, -0.8187853, -1.375666, 1, 1, 1, 1, 1,
-0.006402484, 0.9767398, -0.05768785, 1, 1, 1, 1, 1,
-0.005806758, 0.498632, -0.4590317, 1, 1, 1, 1, 1,
-0.004083953, 1.504111, 0.5165609, 1, 1, 1, 1, 1,
-0.001240987, -0.4255713, -2.749496, 1, 1, 1, 1, 1,
0.001541363, -2.584072, 6.00212, 1, 1, 1, 1, 1,
0.001822218, -0.05605451, 3.691287, 1, 1, 1, 1, 1,
0.006604889, 0.04392819, 0.339488, 0, 0, 1, 1, 1,
0.009396909, -1.365757, 2.793453, 1, 0, 0, 1, 1,
0.01097319, -0.2693576, 3.999131, 1, 0, 0, 1, 1,
0.01247052, 1.020462, -0.7497923, 1, 0, 0, 1, 1,
0.01315343, -1.032055, 4.089107, 1, 0, 0, 1, 1,
0.0131889, -0.8880042, 2.56005, 1, 0, 0, 1, 1,
0.01343449, -0.02391317, 1.980847, 0, 0, 0, 1, 1,
0.01751421, 0.02637834, 0.5997037, 0, 0, 0, 1, 1,
0.02617156, 0.791431, 0.7487856, 0, 0, 0, 1, 1,
0.0310232, -0.9676058, 4.096747, 0, 0, 0, 1, 1,
0.03421564, -0.1241264, 4.932597, 0, 0, 0, 1, 1,
0.03553533, -1.660011, 2.647412, 0, 0, 0, 1, 1,
0.04495457, 0.4164307, -1.441474, 0, 0, 0, 1, 1,
0.04737486, -0.512058, 3.355156, 1, 1, 1, 1, 1,
0.04787766, 0.1208089, 0.1081254, 1, 1, 1, 1, 1,
0.05131951, 0.05850979, 1.897891, 1, 1, 1, 1, 1,
0.05232473, -0.4355925, 2.486554, 1, 1, 1, 1, 1,
0.05361629, 1.704558, -0.731247, 1, 1, 1, 1, 1,
0.05623328, 0.1287907, -0.2655197, 1, 1, 1, 1, 1,
0.05632969, 0.04505265, 1.576016, 1, 1, 1, 1, 1,
0.05709681, 1.08917, -0.9233561, 1, 1, 1, 1, 1,
0.0652533, -1.921227, 2.944314, 1, 1, 1, 1, 1,
0.06980646, -0.2521016, 3.270411, 1, 1, 1, 1, 1,
0.0702429, -2.481969, 3.568278, 1, 1, 1, 1, 1,
0.08046631, 0.01480422, 2.143887, 1, 1, 1, 1, 1,
0.08185924, -0.1744508, 2.463072, 1, 1, 1, 1, 1,
0.08455217, 0.2088188, -0.848989, 1, 1, 1, 1, 1,
0.08606406, -2.563565, 3.619982, 1, 1, 1, 1, 1,
0.08708829, 0.7777261, -1.037689, 0, 0, 1, 1, 1,
0.0893603, -0.5340648, 3.985013, 1, 0, 0, 1, 1,
0.09103709, 0.08948711, 1.015748, 1, 0, 0, 1, 1,
0.09166321, -0.6250728, 2.931769, 1, 0, 0, 1, 1,
0.09544344, 0.04476908, 0.4695618, 1, 0, 0, 1, 1,
0.1003984, 1.876118, 1.923313, 1, 0, 0, 1, 1,
0.1067635, 1.441919, 0.4475607, 0, 0, 0, 1, 1,
0.1070189, 1.656604, 0.8437809, 0, 0, 0, 1, 1,
0.110405, 0.4612161, -1.103802, 0, 0, 0, 1, 1,
0.1105657, 1.753504, 0.182673, 0, 0, 0, 1, 1,
0.1112081, -0.01510322, -0.04955542, 0, 0, 0, 1, 1,
0.1184363, -0.05186857, 1.964077, 0, 0, 0, 1, 1,
0.1211499, -0.3140603, 2.104217, 0, 0, 0, 1, 1,
0.131544, -0.5552567, 2.088551, 1, 1, 1, 1, 1,
0.1322816, 0.8553415, 1.024311, 1, 1, 1, 1, 1,
0.1346488, -1.271862, 4.792414, 1, 1, 1, 1, 1,
0.1360872, 0.4466859, 0.1464909, 1, 1, 1, 1, 1,
0.1362247, -0.5522982, 4.123825, 1, 1, 1, 1, 1,
0.1372658, -0.7565834, 3.033586, 1, 1, 1, 1, 1,
0.138918, 0.7648591, -0.9656459, 1, 1, 1, 1, 1,
0.1402838, -0.1827329, 2.792027, 1, 1, 1, 1, 1,
0.1427421, -0.38363, 3.144997, 1, 1, 1, 1, 1,
0.1458767, 0.5139787, 0.1848458, 1, 1, 1, 1, 1,
0.146339, 1.226976, -0.5731496, 1, 1, 1, 1, 1,
0.1477549, 0.4208027, -0.243864, 1, 1, 1, 1, 1,
0.150511, -0.0939503, 0.8048324, 1, 1, 1, 1, 1,
0.158518, 0.4246691, 1.470499, 1, 1, 1, 1, 1,
0.1659794, 1.259112, 0.2447003, 1, 1, 1, 1, 1,
0.1663844, -0.3149815, 1.895282, 0, 0, 1, 1, 1,
0.1685976, -0.4841927, 4.737489, 1, 0, 0, 1, 1,
0.1719207, -1.615341, 3.151385, 1, 0, 0, 1, 1,
0.1830479, 0.7697961, -0.5306082, 1, 0, 0, 1, 1,
0.1839053, -0.6842927, 2.876217, 1, 0, 0, 1, 1,
0.1859442, 0.102598, 1.531707, 1, 0, 0, 1, 1,
0.1878966, 1.116406, -0.7133436, 0, 0, 0, 1, 1,
0.19354, -0.8510398, 3.197011, 0, 0, 0, 1, 1,
0.1945359, 0.5312144, 1.031095, 0, 0, 0, 1, 1,
0.1998152, 0.7396318, -0.3633318, 0, 0, 0, 1, 1,
0.1998564, 1.74585, 0.1952743, 0, 0, 0, 1, 1,
0.2009697, 1.631682, -0.4818166, 0, 0, 0, 1, 1,
0.2019958, -0.7517444, 2.869487, 0, 0, 0, 1, 1,
0.2114779, 1.290611, -1.354236, 1, 1, 1, 1, 1,
0.2119871, -1.122048, 1.858349, 1, 1, 1, 1, 1,
0.2130143, -0.7499181, 0.6941768, 1, 1, 1, 1, 1,
0.2198504, -0.9624262, 4.220477, 1, 1, 1, 1, 1,
0.2213099, 0.1895081, 0.5272222, 1, 1, 1, 1, 1,
0.22742, -0.3877598, 3.17421, 1, 1, 1, 1, 1,
0.227633, 0.7553424, -0.8260759, 1, 1, 1, 1, 1,
0.2281729, 0.8852236, 0.01563349, 1, 1, 1, 1, 1,
0.2286039, -2.440677, 2.097069, 1, 1, 1, 1, 1,
0.231926, 0.455466, 1.117872, 1, 1, 1, 1, 1,
0.2334962, 0.644041, 0.3790038, 1, 1, 1, 1, 1,
0.2335288, -0.5027749, 1.811607, 1, 1, 1, 1, 1,
0.233913, 0.666522, -0.3977717, 1, 1, 1, 1, 1,
0.234311, -0.7788165, 2.624484, 1, 1, 1, 1, 1,
0.2347818, 1.327927, -0.06590123, 1, 1, 1, 1, 1,
0.2375647, 1.351156, -1.973674, 0, 0, 1, 1, 1,
0.2403617, 0.08702479, 0.5611523, 1, 0, 0, 1, 1,
0.240499, 0.191887, -0.03285212, 1, 0, 0, 1, 1,
0.2424438, 1.149094, -0.02599781, 1, 0, 0, 1, 1,
0.2511552, -0.3452045, 3.210707, 1, 0, 0, 1, 1,
0.25152, 1.763105, -0.846517, 1, 0, 0, 1, 1,
0.2601692, -0.2631584, 0.04189531, 0, 0, 0, 1, 1,
0.2627246, -0.3187608, 2.143784, 0, 0, 0, 1, 1,
0.2653583, -0.6247981, 4.398271, 0, 0, 0, 1, 1,
0.2669978, -0.1986017, 2.189911, 0, 0, 0, 1, 1,
0.2732427, 1.111227, -1.229373, 0, 0, 0, 1, 1,
0.2756087, -1.432464, 3.932567, 0, 0, 0, 1, 1,
0.2775002, -0.1675135, 2.696652, 0, 0, 0, 1, 1,
0.2804607, -0.4069444, 0.2123298, 1, 1, 1, 1, 1,
0.2808225, -1.023754, 1.966308, 1, 1, 1, 1, 1,
0.286124, -0.412991, 1.795582, 1, 1, 1, 1, 1,
0.2916202, 0.2125648, 1.336551, 1, 1, 1, 1, 1,
0.2928842, -1.506029, 3.945613, 1, 1, 1, 1, 1,
0.3020565, -0.2405767, 0.9588336, 1, 1, 1, 1, 1,
0.3061076, 0.777271, 2.621301, 1, 1, 1, 1, 1,
0.3073979, 0.7981589, 0.3382847, 1, 1, 1, 1, 1,
0.3098352, 0.1740297, 1.094401, 1, 1, 1, 1, 1,
0.3118811, 1.544779, -0.272955, 1, 1, 1, 1, 1,
0.317904, -1.413606, -0.1311644, 1, 1, 1, 1, 1,
0.3265182, -1.573977, 4.136395, 1, 1, 1, 1, 1,
0.3328495, -0.7468711, 2.4899, 1, 1, 1, 1, 1,
0.3345969, -0.6040009, 2.514452, 1, 1, 1, 1, 1,
0.3396417, 0.4530631, 0.7654877, 1, 1, 1, 1, 1,
0.3473548, -1.439631, 2.886528, 0, 0, 1, 1, 1,
0.3594908, -0.5712509, 1.83469, 1, 0, 0, 1, 1,
0.3667266, -0.5855965, 3.310936, 1, 0, 0, 1, 1,
0.3679681, -0.1630406, 2.288012, 1, 0, 0, 1, 1,
0.3682732, 2.064861, -0.8665636, 1, 0, 0, 1, 1,
0.3700012, 1.251311, 1.036892, 1, 0, 0, 1, 1,
0.3720871, -0.6977077, 1.038223, 0, 0, 0, 1, 1,
0.3738323, -1.111967, 2.91657, 0, 0, 0, 1, 1,
0.3837855, -1.811147, 3.191343, 0, 0, 0, 1, 1,
0.3846603, -1.022768, 3.375988, 0, 0, 0, 1, 1,
0.3858893, -1.123227, 2.532464, 0, 0, 0, 1, 1,
0.3900368, 0.8513671, -0.3245973, 0, 0, 0, 1, 1,
0.3904689, 0.6890702, 1.063696, 0, 0, 0, 1, 1,
0.392138, -0.8826149, 1.825433, 1, 1, 1, 1, 1,
0.4044156, 0.9309459, 0.7386789, 1, 1, 1, 1, 1,
0.4047494, 0.06033629, 1.414316, 1, 1, 1, 1, 1,
0.404884, 0.8233784, -0.3202226, 1, 1, 1, 1, 1,
0.40497, -2.545861, 2.82955, 1, 1, 1, 1, 1,
0.4061102, 0.9181334, 1.030545, 1, 1, 1, 1, 1,
0.4112509, 0.103494, 0.9603823, 1, 1, 1, 1, 1,
0.4114072, -0.2702279, 0.9992399, 1, 1, 1, 1, 1,
0.4124587, 1.495858, -0.2406104, 1, 1, 1, 1, 1,
0.4143794, -1.021052, 2.608506, 1, 1, 1, 1, 1,
0.4213876, 1.128511, 0.1099361, 1, 1, 1, 1, 1,
0.4235463, -0.8701875, 4.047191, 1, 1, 1, 1, 1,
0.427378, 0.4750578, 0.3574114, 1, 1, 1, 1, 1,
0.429994, -1.351273, 3.66922, 1, 1, 1, 1, 1,
0.4308507, 0.5129024, -0.2304964, 1, 1, 1, 1, 1,
0.4339921, 0.8529313, -0.9147627, 0, 0, 1, 1, 1,
0.4343978, 0.4244861, 0.2267347, 1, 0, 0, 1, 1,
0.4359792, -0.8091484, 2.928792, 1, 0, 0, 1, 1,
0.43854, -0.1061673, 2.728017, 1, 0, 0, 1, 1,
0.4387098, 0.991621, 1.066591, 1, 0, 0, 1, 1,
0.4400975, -1.103518, 2.988583, 1, 0, 0, 1, 1,
0.4434809, 1.459654, 1.440795, 0, 0, 0, 1, 1,
0.4436924, 1.43779, -1.340767, 0, 0, 0, 1, 1,
0.4457678, -1.312429, 3.414506, 0, 0, 0, 1, 1,
0.4482248, 0.4342446, 1.248713, 0, 0, 0, 1, 1,
0.449858, -1.012015, 2.760462, 0, 0, 0, 1, 1,
0.4588349, -1.157847, 1.827069, 0, 0, 0, 1, 1,
0.4597706, 0.8260223, 0.475672, 0, 0, 0, 1, 1,
0.4601351, -0.09509106, 2.756747, 1, 1, 1, 1, 1,
0.4630775, -1.876256, 2.896191, 1, 1, 1, 1, 1,
0.4635985, -0.680675, 2.422989, 1, 1, 1, 1, 1,
0.4641986, -0.368032, 2.079502, 1, 1, 1, 1, 1,
0.4653746, -1.070915, 1.079414, 1, 1, 1, 1, 1,
0.4722638, 1.193642, -0.1698735, 1, 1, 1, 1, 1,
0.4737574, 0.4736586, 1.351617, 1, 1, 1, 1, 1,
0.4797127, -0.6134555, 3.673155, 1, 1, 1, 1, 1,
0.4922392, -1.821225, 1.363651, 1, 1, 1, 1, 1,
0.4952514, 0.002681991, 1.18567, 1, 1, 1, 1, 1,
0.4957135, 1.295149, 0.4534008, 1, 1, 1, 1, 1,
0.4967656, -0.1170054, 2.065573, 1, 1, 1, 1, 1,
0.496943, 0.635098, 0.2128308, 1, 1, 1, 1, 1,
0.4988212, -1.225069, 3.950985, 1, 1, 1, 1, 1,
0.5002462, 0.8631312, 0.6209121, 1, 1, 1, 1, 1,
0.5053643, -0.9054547, 3.180422, 0, 0, 1, 1, 1,
0.5065366, 0.8576475, 2.238708, 1, 0, 0, 1, 1,
0.5073424, 0.5811924, 0.5378135, 1, 0, 0, 1, 1,
0.5095516, -2.404962, 3.229216, 1, 0, 0, 1, 1,
0.5105751, 0.3917072, -0.02589637, 1, 0, 0, 1, 1,
0.5146273, -0.994996, 2.407251, 1, 0, 0, 1, 1,
0.5160643, -1.262086, 3.796472, 0, 0, 0, 1, 1,
0.5248377, -0.9692491, 1.660282, 0, 0, 0, 1, 1,
0.5264134, -0.7744723, 2.30742, 0, 0, 0, 1, 1,
0.5287023, -0.6993727, 0.9780834, 0, 0, 0, 1, 1,
0.5293063, 0.5902869, 0.7721608, 0, 0, 0, 1, 1,
0.5308676, 0.3265898, 0.9983826, 0, 0, 0, 1, 1,
0.5373305, 2.704928, -0.3000494, 0, 0, 0, 1, 1,
0.5432331, 1.188508, 1.751245, 1, 1, 1, 1, 1,
0.5449745, -1.461951, 3.464652, 1, 1, 1, 1, 1,
0.549161, -0.2647773, 3.988878, 1, 1, 1, 1, 1,
0.5506341, -2.375214, 1.868433, 1, 1, 1, 1, 1,
0.5511769, 0.4293924, 0.4664161, 1, 1, 1, 1, 1,
0.5524336, 0.694209, 1.075904, 1, 1, 1, 1, 1,
0.5527903, -0.7443507, 3.740288, 1, 1, 1, 1, 1,
0.5541571, 0.183843, 2.612008, 1, 1, 1, 1, 1,
0.558089, -0.3073633, 1.386721, 1, 1, 1, 1, 1,
0.5633959, -2.517318, 1.215395, 1, 1, 1, 1, 1,
0.5687875, -1.494086, 3.586998, 1, 1, 1, 1, 1,
0.5696616, 0.03872554, 2.708076, 1, 1, 1, 1, 1,
0.5741505, -1.335604, 3.533774, 1, 1, 1, 1, 1,
0.5808194, -0.2611579, 2.882392, 1, 1, 1, 1, 1,
0.58548, 0.03646748, 1.838231, 1, 1, 1, 1, 1,
0.5878069, 1.68921, 0.9098769, 0, 0, 1, 1, 1,
0.5887405, -0.4468333, 3.596202, 1, 0, 0, 1, 1,
0.5889516, -0.2141092, 3.900359, 1, 0, 0, 1, 1,
0.5893267, 1.465204, 0.9629349, 1, 0, 0, 1, 1,
0.5952671, 1.023947, 0.7738937, 1, 0, 0, 1, 1,
0.5987595, 1.841073, 1.379209, 1, 0, 0, 1, 1,
0.5991731, -1.064151, 3.911546, 0, 0, 0, 1, 1,
0.6008328, 1.456628, 1.239792, 0, 0, 0, 1, 1,
0.6093883, 0.9107559, 1.351575, 0, 0, 0, 1, 1,
0.6094513, 1.278501, 0.4893373, 0, 0, 0, 1, 1,
0.6101254, 0.859774, 1.289341, 0, 0, 0, 1, 1,
0.6102781, -0.4940099, 2.355113, 0, 0, 0, 1, 1,
0.6157305, 0.257916, 0.3395552, 0, 0, 0, 1, 1,
0.6200646, -0.7422833, 2.81119, 1, 1, 1, 1, 1,
0.6265141, -0.8324115, 2.327978, 1, 1, 1, 1, 1,
0.6269798, 0.7480013, 1.854761, 1, 1, 1, 1, 1,
0.6315197, -0.873445, 3.505301, 1, 1, 1, 1, 1,
0.6340245, 2.402614, -0.8234433, 1, 1, 1, 1, 1,
0.6347471, 2.630551, -0.5119599, 1, 1, 1, 1, 1,
0.6371577, 0.5985735, 2.629827, 1, 1, 1, 1, 1,
0.6382011, -0.7001503, 2.099547, 1, 1, 1, 1, 1,
0.6390354, -0.4627829, 2.352623, 1, 1, 1, 1, 1,
0.6390651, 0.1535018, -0.1140738, 1, 1, 1, 1, 1,
0.6399284, 0.1554239, 2.219839, 1, 1, 1, 1, 1,
0.6415084, -1.068504, 3.128987, 1, 1, 1, 1, 1,
0.6418743, -1.13687, 3.636076, 1, 1, 1, 1, 1,
0.6426402, -0.2405526, 2.019852, 1, 1, 1, 1, 1,
0.6433951, 0.9250766, 0.1822877, 1, 1, 1, 1, 1,
0.6437078, -0.3188536, 3.053957, 0, 0, 1, 1, 1,
0.6554793, -1.797694, 3.204722, 1, 0, 0, 1, 1,
0.6555249, 0.2005265, 3.057247, 1, 0, 0, 1, 1,
0.6658318, 0.6997349, 0.4832082, 1, 0, 0, 1, 1,
0.6658452, 0.9634412, 0.1581616, 1, 0, 0, 1, 1,
0.6707019, -0.2832054, 2.521277, 1, 0, 0, 1, 1,
0.6742377, 1.021098, 0.257631, 0, 0, 0, 1, 1,
0.6750512, -1.132255, 3.766722, 0, 0, 0, 1, 1,
0.6750799, 0.2469763, 1.114997, 0, 0, 0, 1, 1,
0.6773136, 1.820586, 1.274681, 0, 0, 0, 1, 1,
0.6778435, 0.6561103, 3.075663, 0, 0, 0, 1, 1,
0.6810488, -0.2488369, 3.707164, 0, 0, 0, 1, 1,
0.6832582, -0.05309403, 2.329653, 0, 0, 0, 1, 1,
0.6955194, 1.489742, 1.35758, 1, 1, 1, 1, 1,
0.6991739, 1.415739, 0.3240567, 1, 1, 1, 1, 1,
0.705165, 0.7906194, 0.4602242, 1, 1, 1, 1, 1,
0.7067126, -0.1956512, 0.7001403, 1, 1, 1, 1, 1,
0.709419, 0.5744156, 1.382513, 1, 1, 1, 1, 1,
0.7110116, 0.1444385, 1.842546, 1, 1, 1, 1, 1,
0.7135556, 0.1760275, 1.950943, 1, 1, 1, 1, 1,
0.7201846, 1.722071, -0.8410264, 1, 1, 1, 1, 1,
0.7243006, -0.5469012, 1.94659, 1, 1, 1, 1, 1,
0.7266177, 0.07811784, 2.097323, 1, 1, 1, 1, 1,
0.7293863, 0.5207592, 1.399101, 1, 1, 1, 1, 1,
0.7451478, 0.3045489, 1.330209, 1, 1, 1, 1, 1,
0.7473397, -0.6329754, 1.528085, 1, 1, 1, 1, 1,
0.7484125, 0.4289013, 3.121918, 1, 1, 1, 1, 1,
0.7515618, -0.4813346, 1.97758, 1, 1, 1, 1, 1,
0.756839, 0.9407035, 0.1143568, 0, 0, 1, 1, 1,
0.7578309, -1.171428, 3.157969, 1, 0, 0, 1, 1,
0.757834, 0.1455285, 1.956432, 1, 0, 0, 1, 1,
0.7591229, -0.6886812, 2.515296, 1, 0, 0, 1, 1,
0.759137, 0.003195706, 3.744196, 1, 0, 0, 1, 1,
0.7647994, -0.9986058, -1.173032, 1, 0, 0, 1, 1,
0.7687021, -2.238816, 3.522602, 0, 0, 0, 1, 1,
0.7727851, -1.222937, 2.190159, 0, 0, 0, 1, 1,
0.7733462, 1.080867, 1.230371, 0, 0, 0, 1, 1,
0.7800248, 1.160616, 1.068215, 0, 0, 0, 1, 1,
0.7865013, -0.3130846, 0.7189843, 0, 0, 0, 1, 1,
0.7874984, 1.463217, 1.017942, 0, 0, 0, 1, 1,
0.7885807, 0.3243161, 0.8959649, 0, 0, 0, 1, 1,
0.790046, -0.6479263, 3.384793, 1, 1, 1, 1, 1,
0.7964428, -1.218193, 2.907246, 1, 1, 1, 1, 1,
0.8027037, -0.9539286, 1.183164, 1, 1, 1, 1, 1,
0.8046649, 0.3456498, 0.833795, 1, 1, 1, 1, 1,
0.813492, 1.098449, -0.4363766, 1, 1, 1, 1, 1,
0.8146434, -0.2773421, 1.713852, 1, 1, 1, 1, 1,
0.817126, -1.641668, 2.12776, 1, 1, 1, 1, 1,
0.819697, 1.650968, 1.347934, 1, 1, 1, 1, 1,
0.8227298, 0.05824066, 2.721664, 1, 1, 1, 1, 1,
0.8237741, -0.2211794, 2.921826, 1, 1, 1, 1, 1,
0.8242006, -1.147339, 2.605464, 1, 1, 1, 1, 1,
0.8243713, 0.6529292, 2.17308, 1, 1, 1, 1, 1,
0.8250191, -0.05048583, 1.867976, 1, 1, 1, 1, 1,
0.8307356, -0.6948055, 3.929501, 1, 1, 1, 1, 1,
0.832643, -0.06195835, 1.040695, 1, 1, 1, 1, 1,
0.8385029, 1.025411, 0.9586505, 0, 0, 1, 1, 1,
0.8388475, 0.1507722, 2.683517, 1, 0, 0, 1, 1,
0.8410565, 0.8187298, 0.5841174, 1, 0, 0, 1, 1,
0.8468872, -0.3405012, 2.879069, 1, 0, 0, 1, 1,
0.8489816, -0.7814946, 1.23401, 1, 0, 0, 1, 1,
0.8496308, 0.252064, 1.051348, 1, 0, 0, 1, 1,
0.8517134, -1.268032, 3.916762, 0, 0, 0, 1, 1,
0.852859, -1.036502, 1.435322, 0, 0, 0, 1, 1,
0.8550881, -0.9318384, 1.815989, 0, 0, 0, 1, 1,
0.8604645, 0.3033046, 2.050812, 0, 0, 0, 1, 1,
0.8695947, 1.696866, 1.183329, 0, 0, 0, 1, 1,
0.8743333, -0.516165, 1.643933, 0, 0, 0, 1, 1,
0.877169, -1.16389, 1.866688, 0, 0, 0, 1, 1,
0.8900548, 0.2881981, 3.089681, 1, 1, 1, 1, 1,
0.8964821, 1.551025, 1.182664, 1, 1, 1, 1, 1,
0.8982906, 0.8365128, 0.4975443, 1, 1, 1, 1, 1,
0.8997308, 0.6816229, -0.09500514, 1, 1, 1, 1, 1,
0.9021047, -0.08891617, 1.184674, 1, 1, 1, 1, 1,
0.9072289, -0.8432658, 3.562599, 1, 1, 1, 1, 1,
0.909355, -0.1257152, 2.078922, 1, 1, 1, 1, 1,
0.9117961, 0.5755687, 0.402032, 1, 1, 1, 1, 1,
0.9120387, 0.8999764, 2.248991, 1, 1, 1, 1, 1,
0.9246548, 0.8054359, 0.2132386, 1, 1, 1, 1, 1,
0.9283699, -0.1033662, 0.6246735, 1, 1, 1, 1, 1,
0.9290962, -0.4741492, 1.283998, 1, 1, 1, 1, 1,
0.9309374, -1.885898, 2.503747, 1, 1, 1, 1, 1,
0.9475108, -0.8067651, 2.699869, 1, 1, 1, 1, 1,
0.948014, -0.9852086, 1.529113, 1, 1, 1, 1, 1,
0.9580109, -1.844013, 2.234652, 0, 0, 1, 1, 1,
0.9659674, 0.1674643, 0.2356399, 1, 0, 0, 1, 1,
0.966301, 1.10185, 1.026904, 1, 0, 0, 1, 1,
0.9673312, -1.238098, 3.161481, 1, 0, 0, 1, 1,
0.9677631, -0.9466386, 2.691831, 1, 0, 0, 1, 1,
0.9686627, -0.934145, 1.496079, 1, 0, 0, 1, 1,
0.9725953, 1.750491, -2.705794, 0, 0, 0, 1, 1,
0.9737419, -0.8761523, 1.389586, 0, 0, 0, 1, 1,
0.9742905, -0.7845514, 2.976371, 0, 0, 0, 1, 1,
0.9746399, 0.7123155, -0.7256939, 0, 0, 0, 1, 1,
0.974807, 0.602922, 1.204447, 0, 0, 0, 1, 1,
0.9771327, 0.2635502, 2.115023, 0, 0, 0, 1, 1,
0.9897667, -0.8894749, 2.250284, 0, 0, 0, 1, 1,
0.9912365, -0.5375089, 3.619576, 1, 1, 1, 1, 1,
0.9923507, -0.7470263, 1.473958, 1, 1, 1, 1, 1,
1.001098, -0.5305549, 0.9125428, 1, 1, 1, 1, 1,
1.002663, 0.3866548, 0.615875, 1, 1, 1, 1, 1,
1.013792, 0.9645945, 0.2197471, 1, 1, 1, 1, 1,
1.014257, -0.7354434, 1.951453, 1, 1, 1, 1, 1,
1.014974, -2.835742, 0.7052402, 1, 1, 1, 1, 1,
1.015585, -0.7470123, 1.111582, 1, 1, 1, 1, 1,
1.029387, -0.2447954, 1.815641, 1, 1, 1, 1, 1,
1.038178, 1.220946, 1.355586, 1, 1, 1, 1, 1,
1.04854, -0.07105324, 2.102859, 1, 1, 1, 1, 1,
1.048644, -0.4417388, 2.350508, 1, 1, 1, 1, 1,
1.055065, 0.02675919, -0.2705238, 1, 1, 1, 1, 1,
1.058304, -0.7583813, 0.7614108, 1, 1, 1, 1, 1,
1.05952, 1.186163, 0.4765445, 1, 1, 1, 1, 1,
1.068989, 1.511212, -1.174475, 0, 0, 1, 1, 1,
1.06957, 1.03513, 1.666149, 1, 0, 0, 1, 1,
1.073591, 0.7937174, 1.984086, 1, 0, 0, 1, 1,
1.078564, -1.440963, 1.919627, 1, 0, 0, 1, 1,
1.079107, -0.9961617, 3.169717, 1, 0, 0, 1, 1,
1.079185, -0.1137257, 1.750345, 1, 0, 0, 1, 1,
1.081689, -0.3635807, 1.144771, 0, 0, 0, 1, 1,
1.081781, -0.172407, 2.527607, 0, 0, 0, 1, 1,
1.083291, -0.4239155, 3.883427, 0, 0, 0, 1, 1,
1.085358, 0.1019267, -0.303317, 0, 0, 0, 1, 1,
1.085515, 0.8080419, 1.151587, 0, 0, 0, 1, 1,
1.090541, -1.660768, 1.186597, 0, 0, 0, 1, 1,
1.106367, 0.5844815, 0.9435952, 0, 0, 0, 1, 1,
1.109032, -1.83968, 3.125928, 1, 1, 1, 1, 1,
1.114046, -0.5161141, 2.343058, 1, 1, 1, 1, 1,
1.120295, -0.8934593, 0.1667971, 1, 1, 1, 1, 1,
1.120934, -0.6028302, 1.639886, 1, 1, 1, 1, 1,
1.123276, 0.947544, 1.413838, 1, 1, 1, 1, 1,
1.12557, 1.925471, -0.5112174, 1, 1, 1, 1, 1,
1.13571, 0.4896901, 0.9482228, 1, 1, 1, 1, 1,
1.158003, -0.5715132, 3.693497, 1, 1, 1, 1, 1,
1.165074, -0.6108668, 1.428332, 1, 1, 1, 1, 1,
1.16729, -0.9578447, 1.28344, 1, 1, 1, 1, 1,
1.170935, 0.5023621, 1.407098, 1, 1, 1, 1, 1,
1.174618, 1.407584, 0.9807568, 1, 1, 1, 1, 1,
1.174894, -0.02908264, 1.648809, 1, 1, 1, 1, 1,
1.183467, 1.033149, 1.166735, 1, 1, 1, 1, 1,
1.19455, 1.72231, 1.283607, 1, 1, 1, 1, 1,
1.195961, -1.421611, 3.011455, 0, 0, 1, 1, 1,
1.207793, 0.9813228, 1.629861, 1, 0, 0, 1, 1,
1.208201, 0.2747278, 3.496073, 1, 0, 0, 1, 1,
1.211733, -0.2703319, 2.008325, 1, 0, 0, 1, 1,
1.21932, -0.5327369, 1.99974, 1, 0, 0, 1, 1,
1.230942, 0.6895154, 0.9081924, 1, 0, 0, 1, 1,
1.236886, 0.6988227, 1.126802, 0, 0, 0, 1, 1,
1.237933, 0.312635, 1.065361, 0, 0, 0, 1, 1,
1.247439, -0.5548422, 1.486842, 0, 0, 0, 1, 1,
1.248501, -1.105839, 1.903047, 0, 0, 0, 1, 1,
1.25017, 1.091125, -0.6290642, 0, 0, 0, 1, 1,
1.26426, 0.6660887, 1.497766, 0, 0, 0, 1, 1,
1.264486, 0.9807997, 1.262362, 0, 0, 0, 1, 1,
1.270831, 0.1637097, 1.25945, 1, 1, 1, 1, 1,
1.277083, -1.123677, 1.558349, 1, 1, 1, 1, 1,
1.286984, 0.1888458, 1.584499, 1, 1, 1, 1, 1,
1.299171, -0.04982688, 0.5862513, 1, 1, 1, 1, 1,
1.30307, -0.03505151, 1.40955, 1, 1, 1, 1, 1,
1.312242, 0.7953722, 1.973782, 1, 1, 1, 1, 1,
1.319428, -1.833272, 3.139149, 1, 1, 1, 1, 1,
1.336176, -2.504812, 2.997976, 1, 1, 1, 1, 1,
1.341225, 1.009322, -0.6556557, 1, 1, 1, 1, 1,
1.351905, 0.005752847, 1.030349, 1, 1, 1, 1, 1,
1.354569, -1.620768, 1.69507, 1, 1, 1, 1, 1,
1.359044, -0.4690136, 2.345606, 1, 1, 1, 1, 1,
1.376368, -0.3722658, 1.910465, 1, 1, 1, 1, 1,
1.377163, 1.15234, 1.960322, 1, 1, 1, 1, 1,
1.384835, 0.9040049, 1.211069, 1, 1, 1, 1, 1,
1.387469, 0.4716613, 2.658136, 0, 0, 1, 1, 1,
1.388801, 0.1611424, 1.955866, 1, 0, 0, 1, 1,
1.389237, 1.08446, 2.443991, 1, 0, 0, 1, 1,
1.390913, -1.367833, 3.389453, 1, 0, 0, 1, 1,
1.401394, 0.1453686, 2.444144, 1, 0, 0, 1, 1,
1.405105, 0.2797585, 1.678601, 1, 0, 0, 1, 1,
1.406227, 0.05613143, 3.441922, 0, 0, 0, 1, 1,
1.419421, 0.8962927, -0.3994972, 0, 0, 0, 1, 1,
1.423526, -0.4394725, 1.301714, 0, 0, 0, 1, 1,
1.429606, -0.4987242, 2.067173, 0, 0, 0, 1, 1,
1.452666, -0.5458096, 2.238638, 0, 0, 0, 1, 1,
1.459438, 0.3771871, 3.725666, 0, 0, 0, 1, 1,
1.462313, -1.405323, 3.507994, 0, 0, 0, 1, 1,
1.47502, 1.270486, -0.6358802, 1, 1, 1, 1, 1,
1.493713, 0.4743011, 1.421563, 1, 1, 1, 1, 1,
1.509287, -0.3665467, 2.590904, 1, 1, 1, 1, 1,
1.517635, 0.2056643, 0.156349, 1, 1, 1, 1, 1,
1.519563, 1.438639, 1.726853, 1, 1, 1, 1, 1,
1.519869, 0.9154167, 4.031129, 1, 1, 1, 1, 1,
1.527469, 2.139694, 2.258254, 1, 1, 1, 1, 1,
1.530831, -0.9840509, -0.02831625, 1, 1, 1, 1, 1,
1.532512, 0.3477289, 1.125361, 1, 1, 1, 1, 1,
1.558222, -0.1723402, 2.115472, 1, 1, 1, 1, 1,
1.567419, -0.3492753, 1.768713, 1, 1, 1, 1, 1,
1.574416, 0.9988112, 0.8934158, 1, 1, 1, 1, 1,
1.576778, 0.9591752, 1.02308, 1, 1, 1, 1, 1,
1.580805, 0.505293, -0.3967019, 1, 1, 1, 1, 1,
1.586881, 2.170238, 0.2212907, 1, 1, 1, 1, 1,
1.59328, 2.045945, -0.5789213, 0, 0, 1, 1, 1,
1.595209, -0.7904348, 1.855791, 1, 0, 0, 1, 1,
1.603288, -1.079635, 0.9232519, 1, 0, 0, 1, 1,
1.612539, -0.7185008, 2.100059, 1, 0, 0, 1, 1,
1.615187, 3.730333, 0.2474345, 1, 0, 0, 1, 1,
1.625556, 0.3999234, 2.426909, 1, 0, 0, 1, 1,
1.665351, -0.3233476, 2.18679, 0, 0, 0, 1, 1,
1.681553, 1.462003, 3.367766, 0, 0, 0, 1, 1,
1.703925, -1.127505, 1.326406, 0, 0, 0, 1, 1,
1.706562, -1.27905, 1.178076, 0, 0, 0, 1, 1,
1.710697, -0.9516878, 3.065054, 0, 0, 0, 1, 1,
1.71232, -1.326867, 2.570566, 0, 0, 0, 1, 1,
1.71482, -0.2640306, 1.405953, 0, 0, 0, 1, 1,
1.72209, -0.01838858, 1.126866, 1, 1, 1, 1, 1,
1.767514, 2.049777, 0.9357675, 1, 1, 1, 1, 1,
1.769726, -0.4472031, 0.8560588, 1, 1, 1, 1, 1,
1.777664, 1.830312, 2.82526, 1, 1, 1, 1, 1,
1.788311, -0.3260125, 0.985214, 1, 1, 1, 1, 1,
1.793573, -0.759962, 3.228459, 1, 1, 1, 1, 1,
1.835748, -0.1604059, 1.761586, 1, 1, 1, 1, 1,
1.840119, 0.595448, 2.00726, 1, 1, 1, 1, 1,
1.846407, 1.013007, 2.731071, 1, 1, 1, 1, 1,
1.854656, -1.33728, 1.943753, 1, 1, 1, 1, 1,
1.860195, 1.418691, 1.359982, 1, 1, 1, 1, 1,
1.872502, -1.272574, 2.654743, 1, 1, 1, 1, 1,
1.873461, -0.6013417, 2.459369, 1, 1, 1, 1, 1,
1.93632, 1.861049, 0.7488925, 1, 1, 1, 1, 1,
1.941274, -1.306508, 0.7488439, 1, 1, 1, 1, 1,
1.957898, -0.06068608, 1.979843, 0, 0, 1, 1, 1,
2.00624, 1.628184, -0.5211232, 1, 0, 0, 1, 1,
2.017029, 0.640147, 0.4998317, 1, 0, 0, 1, 1,
2.035013, 0.3785757, 2.291679, 1, 0, 0, 1, 1,
2.062295, -0.6557358, 1.974949, 1, 0, 0, 1, 1,
2.068777, -1.814153, 1.237019, 1, 0, 0, 1, 1,
2.14636, -0.8899631, 2.391684, 0, 0, 0, 1, 1,
2.183645, -0.4825045, 2.488278, 0, 0, 0, 1, 1,
2.276021, 1.251837, -0.9689348, 0, 0, 0, 1, 1,
2.290362, 0.2914074, 1.412058, 0, 0, 0, 1, 1,
2.362458, -0.1794843, 2.091676, 0, 0, 0, 1, 1,
2.410149, 0.3717471, 1.134271, 0, 0, 0, 1, 1,
2.421285, -0.04617298, 0.06048625, 0, 0, 0, 1, 1,
2.468233, 0.6464471, -0.2594526, 1, 1, 1, 1, 1,
2.480433, -0.06480038, 1.076432, 1, 1, 1, 1, 1,
2.577699, -0.5089387, 2.92206, 1, 1, 1, 1, 1,
2.596806, -0.1631286, 2.274453, 1, 1, 1, 1, 1,
2.61365, 0.08192004, 2.214973, 1, 1, 1, 1, 1,
2.659509, -0.3791767, 1.059391, 1, 1, 1, 1, 1,
2.746829, 1.210084, 0.7223806, 1, 1, 1, 1, 1
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
var radius = 10.02935;
var distance = 35.22768;
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
mvMatrix.translate( 0.3327743, -0.3782011, -0.1067359 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.22768);
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
